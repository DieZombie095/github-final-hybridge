#!/usr/bin/env bash
# Recopila evidencia; no modifica configuraciones.
set -u
echo '===== FECHA ====='; date -Is
echo '===== SSH ====='; sudo sshd -t && sudo sshd -T | grep -E '^(port|permitrootlogin|pubkeyauthentication|passwordauthentication|maxauthtries) '
echo '===== UFW ====='; sudo ufw status verbose; sudo ufw status numbered
echo '===== FAIL2BAN ====='; sudo fail2ban-client status; sudo fail2ban-client status sshd
echo '===== SOCKETS ====='; sudo ss -tulpn
echo '===== SERVICIOS ====='; systemctl is-active ssh || systemctl is-active sshd
systemctl is-active ufw; systemctl is-active fail2ban
