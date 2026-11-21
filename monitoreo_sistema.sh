#!/bin/bash
# monitoreo_sistema.sh
# Registra indicadores básicos del servidor Linux en /var/log/monitoreo_sistema.log.
# Debe ejecutarse con permisos suficientes para leer todos los procesos y escribir el log.
set -u
LOG="/var/log/monitoreo_sistema.log"
FECHA="$(date '+%Y-%m-%d %H:%M:%S')"
touch "$LOG" 2>/dev/null || { echo "No se pudo escribir en $LOG. Ejecuta el script con sudo." >&2; exit 1; }
{
  echo "===== MONITOREO: $FECHA ====="
  echo "[CARGA]"
  uptime
  echo "[MEMORIA Y SWAP]"
  free -h
  echo "[ALMACENAMIENTO]"
  df -h -x tmpfs -x devtmpfs
  echo "[PROCESOS: MAYOR CPU]"
  ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6
  echo "[PROCESOS: MAYOR MEMORIA]"
  ps -eo pid,comm,%cpu,%mem --sort=-%mem | head -n 6
  echo
} >> "$LOG" 2>&1
