# rpi-dehydrated
Raspberry Pi Docker Container for Loopia Let's Encrypt certificates<BR>

Multiarch build using balena's Raspberry Pi image and docker's official Debian image.<BR>
Running with tag :latest should work on all Raspberry Pi models and standard 64-bit hardware.

The container tries to ease certificate management. It uses dehydrated to request new wildcard certs, and a Loopia hook to update public DNS TXT records.

Run with:<BR>
docker run -it \\\
-e "LETSENCRYPT_EMAIL=someone@somewhere.tld" \\\
-e "LETSENCRYPT_DOMAIN=yourdomain.tld" \\\
-e "LOOPIA_USER=yourapiuser@loopiaapi" \\\
-e "LOOPIA_PASSWORD=yourapipassword" \\\
--mount type=bind,src=/some/path/letsencrypt,dst=/letsencrypt \\\
mattiasegly/rpi-dehydrated:latest

I know nothing about code, so assume that everything here sets the world on fire.<BR>
Use at your own peril.

Built on the work of:<BR>
https://github.com/lukas2511/dehydrated<BR>
https://github.com/aaff-se/dehydrated-loopia-api-hook
