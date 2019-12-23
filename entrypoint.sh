#!/bin/bash

echo "Create dehydrated configuration file..."
cat > /dehydrated/config << EOF
CA="https://acme-v02.api.letsencrypt.org/directory"
#CA="https://acme-staging-v02.api.letsencrypt.org/directory"
CHALLENGETYPE="dns-01"
DOMAINS_TXT="/dehydrated/domains.txt"
CONTACT_EMAIL="$LETSENCRYPT_EMAIL"
HOOK="/dehydrated/hooks/loopia/loopia_hook.sh"
CERTDIR="/letsencrypt"
EOF

echo "Create domain list file..."
cat > /dehydrated/domains.txt << EOF
$LETSENCRYPT_DOMAIN *.$LETSENCRYPT_DOMAIN
EOF

echo "Create loopia auth file..."
cat > /dehydrated/hooks/loopia/loopia-api-user.auth << EOF
user='$LOOPIA_USER'
pass='$LOOPIA_PASSWORD'
EOF

echo "Print dehydrated configuration values..."
/dehydrated/dehydrated --env

echo "Finished! Run container."
exec "$@"
