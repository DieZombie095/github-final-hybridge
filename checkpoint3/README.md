# Checkpoint 3 — Seguridad de Tech Solutions Inc.

Este directorio reúne plantillas y herramientas para el endurecimiento de SSH, UFW y Fail2Ban.

- `sshd_config_fragmento.conf`: directivas SSH sugeridas.
- `ufw_configuracion.sh`: reglas básicas de UFW.
- `jail.local`: jail de Fail2Ban para SSH.
- `ufw.conf`: referencia mínima.
- `auditoria_y_pruebas.sh`: recopilación de estados.
- `plantilla_evidencias.md`: checklist para documentar resultados reales.

El reporte PDF y el paquete completo se entregan como archivos descargables en la conversación.

**Importante:** adapta el puerto 2222 y los servicios a tu entorno. Mantén acceso de recuperación, valida `sudo sshd -t` y prueba una segunda conexión antes de cerrar la sesión actual. Las evidencias deben proceder de pruebas reales; no están simuladas en este repositorio.
