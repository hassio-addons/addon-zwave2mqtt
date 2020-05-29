#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Community Add-on: Z-Wave to MQTT
# Configures NGINX for use with this add-on.
# ==============================================================================
declare certfile
declare keyfile
declare dns_host

dns_host=$(bashio::dns.host)
sed -i "s/%%dns_host%%/${dns_host}/g" /etc/nginx/includes/resolver.conf

ingress_interface=$(bashio::addon.ip_address)
sed -i "s/%%interface%%/${ingress_interface}/g" /etc/nginx/servers/ingress.conf

