#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Community Add-on: Z-Wave to MQTT
# Configures OpenSSH for use with this add-on.
# ==============================================================================

ssh-keygen -b 521 -t ecdsa -C"$(id -un)@$(hostname)-$(date -Iseconds)" -f /etc/ssh/ssh_host_ecdsa_key -P

ROOT_PASS="$(bashio::config 'root_password')"
if [ ! -z "${ROOT_PASS}" ]
  bashio::log.info "Setting up root user password"
  passwd -u root
  echo -e "${ROOT_PASS}\n${ROOT_PASS}" | passwd  root
else
  bashio::log.info "NOT setting up root pass - will be unable to use ssh"
fi

