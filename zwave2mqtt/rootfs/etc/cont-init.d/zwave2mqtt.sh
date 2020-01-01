#!/usr/bin/with-contenv bashio
# ==============================================================================
# Community Hass.io Add-ons: Z-Wave to MQTT
# Lorem ipsum
# ==============================================================================

# Ensure store is persistent
rm -f -r /opt/store
ln -s /data /opt/store

if bashio::config.exists 'config_path'; then
    rm -f -r /usr/etc/openzwave
    ln -s $(bashio::config 'config_path') /usr/etc/openzwave
fi
