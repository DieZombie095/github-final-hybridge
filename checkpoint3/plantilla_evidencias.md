# Evidencias — completar con resultados reales

Fecha/hora y zona horaria:
Servidor/IP de laboratorio:
Puerto SSH nuevo:
Usuario de prueba:

## SSH con clave
Comando: `ssh -p 2222 -i ~/.ssh/CLAVE usuario@IP`
Resultado real:
Captura:

## UFW
Comando: `sudo ufw status numbered`
Salida real:
Captura:

## Fail2Ban
Comandos: `sudo fail2ban-client status` y `sudo fail2ban-client status sshd`
IP de laboratorio bloqueada:
Resultado real / hora:
Captura:

## Escaneo antes y después
Desde un equipo autorizado: `nmap -Pn -sT -p- IP_DEL_SERVIDOR`
Antes:
Después:
No escanear equipos o redes sin autorización.

## Auditoría
Adjuntar salida de `bash auditoria_y_pruebas.sh`.
Si una prueba no se realizó, marcarla como pendiente; no inventar resultados.
