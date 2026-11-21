# Reporte técnico — Monitoreo y optimización del servidor Linux

## 1. Objetivo
Documentar la supervisión de procesos y recursos, ajustes de prioridades, configuración de swap y automatización del monitoreo en Ubuntu Server.

## 2. Monitoreo de procesos y recursos
Se utilizan:
```bash
top
ps aux --sort=-%cpu | head
ps aux --sort=-%mem | head
free -h
vmstat 1 5
df -h
uptime
```
`top` muestra procesos en tiempo real; `ps` permite ordenar por consumo; `free` y `vmstat` muestran memoria; `df` revisa almacenamiento y `uptime` presenta promedios de carga.

## 3. Ajustes de procesos
Para iniciar una tarea no crítica con menor prioridad:
```bash
nice -n 10 comando
sudo renice 10 -p PID
```
Identificar el PID antes de modificarlo. No cambiar prioridades de procesos esenciales sin conocer su función.

## 4. Swap y memoria
Ejemplo de creación de 2 GiB de swap (solo si hay espacio suficiente y no existe ya una configuración equivalente):
```bash
sudo fallocate -l 2G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
swapon --show
free -h
```
Agregar una sola vez a `/etc/fstab`:
```
/swapfile none swap sw 0 0
```
Ajuste moderado de ejemplo:
```bash
echo 'vm.swappiness=10' | sudo tee /etc/sysctl.d/99-tech-solutions-memory.conf
sudo sysctl --system
sysctl vm.swappiness
```
El valor debe validarse con la carga real; no desactiva swap ni es universalmente óptimo.

## 5. Script y programación
Instalar y probar:
```bash
sudo install -m 755 monitoreo_sistema.sh /usr/local/bin/monitoreo_sistema.sh
sudo touch /var/log/monitoreo_sistema.log
sudo chmod 640 /var/log/monitoreo_sistema.log
sudo /usr/local/bin/monitoreo_sistema.sh
```
Cron cada cinco minutos:
```cron
*/5 * * * * /usr/local/bin/monitoreo_sistema.sh
```
Verificar con `sudo crontab -l`.

## 6. Evidencia
Adjuntar capturas reales de `top`, `free -h`, `swapon --show`, `df -h`, `sysctl vm.swappiness`, `sudo crontab -l` y el log real.

Para obtener tres entradas reales:
```bash
sudo /usr/local/bin/monitoreo_sistema.sh
sudo /usr/local/bin/monitoreo_sistema.sh
sudo /usr/local/bin/monitoreo_sistema.sh
sudo grep -c '^===== MONITOREO:' /var/log/monitoreo_sistema.log
sudo tail -n 100 /var/log/monitoreo_sistema.log
```
El archivo `monitoreo_sistema.log.ejemplo` es únicamente una muestra del formato, no sustituye el registro generado en el servidor.
