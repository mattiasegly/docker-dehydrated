# rpi-dehydrated
Docker container for Let's Encrypt certificates.<BR>
Multi-arch build using balena's Raspberry Pi image and docker's official Debian image.

The container tries to ease certificate management. It uses dehydrated to request new wildcard certs, and a hook to manually update public DNS TXT records.

Run with:<BR>
docker run -it \\\
-e "LETSENCRYPT_EMAIL=someone@somewhere.tld" \\\
-e "LETSENCRYPT_DOMAIN=yourdomain.tld" \\\
--mount type=bind,src=/some/path/letsencrypt,dst=/letsencrypt \\\
mattiasegly/rpi-dehydrated:latest

I know nothing about code, so assume that everything here sets the world on fire.<BR>
Use at your own peril.

Built on the work of:<BR>
https://github.com/lukas2511/dehydrated<BR>
https://github.com/gheja/dns-01-manual
