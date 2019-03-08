# docker-rpi-dehydrated
Raspberry Pi Docker Container for Let's Encrypt certificates<BR>
The container tries to ease certificate management. It uses dehydrated to request new wildcard certs, a Loopia hook to update public DNS TXT records (havent figured out how to make it work yet), and also create a cert bundle that can be used by HAProxy.<BR>
This is work in progress, that's why it has to be run in an interactive terminal.

Run with:<BR>
docker run -it \
-e "LETSENCRYPT_EMAIL=someone@somewhere.tld" \
-e "LETSENCRYPT_DOMAIN=yourdomain.tld" \
-e "LOOPIA_USER=yourapiuser@loopiaapi" \
-e "LOOPIA_PASSWORD=yourapipassword" \
--mount type=bind,src=/some/path/letsencrypt,dst=/letsencrypt \
dehydrated bash

I know nothing about code, so assume that everything here sets the world on fire.
Use at your own peril.

Built on the work of:<BR>
https://github.com/lukas2511/dehydrated<BR>
https://github.com/aaff-se/dehydrated-loopia-api-hook
