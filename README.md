# OHIF-dcm4chee
This project combines the excellent PACS/VNA dcm4chee along with OHIF as a viewer. 

Usage:
- rename .env.development to .env and customise
- set desired profiles and environment variables in .env
- set <docker_host> to correct hostname in relevant ./config/app-config-*.js
- define local timezone in ./config/etc/timezone
- run these commands in the docker-compose.yml directory before initialising project for the first time
-- sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ./config/self-signed-private.key -out ./config/self-signed.crt
-- sudo chmod 644 ./config/self-signed.crt ./config/self-signed-private.key
- after keycloak has started - need to register OHIF as OIDC client

Note: takes a while for keycloak to spin up the first boot, be patient.