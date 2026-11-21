#!/usr/bin/env bash
# Ejecutar desde consola local o con acceso de recuperación.
set -euo pipefail
SSH_PORT="${SSH_PORT:-2222}"
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow "${SSH_PORT}/tcp" comment 'SSH administracion'
# Agregar solo los servicios necesarios, por ejemplo: sudo ufw allow 443/tcp
sudo ufw --force enable
sudo ufw status verbose
sudo ufw status numbered
