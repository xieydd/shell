openssl genrsa -out ca.key 4096
openssl req -x509 -new -nodes -sha512 -days 3650 \
-subj "/C=CN/ST=SH/L=SH/O=example/OU=Personal/CN=harbor.unisound.test" \
-key ca.key \
-out ca.crt
openssl genrsa -out harbor.unisound.test.key 4096
openssl req -sha512 -new \
-subj "/C=CN/ST=SH/L=SH/O=example/OU=Personal/CN=harbor.unisound.test" \
-key harbor.unisound.test.key \
-out harbor.unisound.test.csr
cat > v3.ext <<-EOF
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
extendedKeyUsage = serverAuth 
subjectAltName = @alt_names

[alt_names]
DNS.1=harbor.unisound.test
DNS.2=harbor.unisound.
DNS.3=hostname
EOF
openssl x509 -req -sha512 -days 3650 \
    -extfile v3.ext \
    -CA ca.crt -CAkey ca.key -CAcreateserial \
    -in harbor.unisound.test.csr \
    -outharbor.unisound.test.crt
