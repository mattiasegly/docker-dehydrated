#!/bin/bash

echo "Create dehydrated configuration file..."
cat > /dehydrated/config << EOF
CA="https://acme-v02.api.letsencrypt.org/directory"
#CA="https://acme-staging-v02.api.letsencrypt.org/directory"
CHALLENGETYPE="dns-01"
DOMAINS_TXT="/dehydrated/domains.txt"
CONTACT_EMAIL="$LETSENCRYPT_EMAIL"
HOOK="/dehydrated/hooks/manual/hook.sh"
CERTDIR="/letsencrypt"
EOF

echo "Create domain list file..."
cat > /dehydrated/domains.txt << EOF
$LETSENCRYPT_DOMAIN *.$LETSENCRYPT_DOMAIN *.internal.$LETSENCRYPT_DOMAIN
EOF

echo "Print dehydrated configuration values..."
/dehydrated/dehydrated --env

echo "Finished! Run container."
exec "$@"
