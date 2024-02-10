# OHIF-dcm4chee
This project combines the excellent PACS/VNA dcm4chee along with OHIF as a viewer. Integration with traefik as reverse proxy, using DNS challenge to provide SSL certificates for a given domain. 
The intention is to run these services on an internal network, not open to the internet.

## Steps before starting:
- ensure local DNS points chosen domain (plus *, or chosen subdomains) to docker server, set DOCKER_HOSTNAME in .env
- ensure you have access to DNS provider for domain name and traefik can communicate for DNS-01 challenge, generate API tokens
- rename .env.development to .env, set variables
- customise app-config-example.js and rename to app-config.js - set <arc_subdomain>.<docker_host>, <keycloak_subdomain>.<docker_host> and <ohif_subdomain>.<docker_host> to your chosen address for each service (eg pacs.example.com) 
- run the following command, and wait until ldap initialisation finished, then Ctrl-C
```
docker compose up ldap 
```
- run 
```
docker compose up -d
```
- log in to keycloak (https://<keycloak_subdomain.docker_host>/admin/dcm4che/console), remove port numbers in dcm4chee-rs and dcm4chee-ui client URLS
- In keycloak admin, create ohif-viewer client (can import /config/ohif-viewer.json after customising URLs)
- Log out, then log in to dcm4chee (https://<arc_subdomain.docker_host>/dcm4chee-arc/ui2), check that initial view loads successfully
- finally trial logging in to OHIF (https//<ohif_subdomain.docker_host>) 

Note: takes a while for keycloak to spin up the first boot, be patient.

## Resources:
- DCM4CHEE: https://github.com/dcm4che/dcm4chee-arc-light/wiki/Running-on-Docker
- OHIF: https://docs.ohif.org/
- TRAEFIK: https://doc.traefik.io/traefik/user-guides/docker-compose/basic-example/   https://doc.traefik.io/traefik/https/acme/#dnschallenge
- Weasis integration: https://weasis.org/en/basics/customize/integration/#dcm4chee-arc-light