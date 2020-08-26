#!/bin/bash
# Check the tls version
openssl s_client -connect master.unisound.ai:443 -tls1_2

# Check the cert date
echo | openssl s_client -connect 10.10.13.223:8443 2>&1 | openssl x509 -noout -dates
