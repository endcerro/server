DOMAIN="$1"
if [ -z "$DOMAIN" ]; then
  echo "Usage: $(basename $0) <domain>"
  exit 11
fi
fail_if_error() {
  [ $1 != 0 ] && {
    unset PASSPHRASE
    exit 10
  }
}
export PASSPHRASE=$(head -c 500 /dev/urandom | tr -dc a-z0-9A-Z | head -c 128)
openssl genrsa -des3 -out $DOMAIN.key -passout env:PASSPHRASE 2048 > out.log 2> err.log
fail_if_error $?
openssl req \
    -new \
    -batch \
    -key $DOMAIN.key \
    -out $DOMAIN.csr \
    -passin env:PASSPHRASE
fail_if_error $?
cp $DOMAIN.key $DOMAIN.key.org
fail_if_error $?
openssl rsa -in $DOMAIN.key.org -out $DOMAIN.key -passin env:PASSPHRASE > /dev/null 2> /dev/null
fail_if_error $?
openssl x509 -req -days 3650 -in $DOMAIN.csr -signkey $DOMAIN.key -out $DOMAIN.crt > /dev/null 2> /dev/null
fail_if_error $?