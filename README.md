# 🚀 Reto Técnico : Salesforce Case SLA Automation

Proyecto desarrollado en Salesforce Service Cloud enfocado en mejorar la gestión de casos mediante automatización, SLA y experiencia de usuario.

---

## 🎯 Objetivo

Optimizar la atención al cliente resolviendo problemas comunes como:

* ❌ Falta de priorización automática de casos
* ❌ Incumplimiento de SLA
* ❌ Baja visibilidad de tiempos para agentes

---

## ⚙️ Solución

Se implementó una solución completa basada en:

### 🧠 Automatización con Apex

* Priorización automática de casos según:

  * Tipo = Incidente y Origen = Chat → Prioridad =🔴 Alta
  * Tipo = Consulta y Origen = Teléfono → Prioridad = 🟡 Media
  * En los demás casos → Prioridad = 🟢 Baja

Cuando un caso sea Alta Prioridad, enviar un correo al gerente de soporte
* Envío de notificación por email para casos críticos

---

### 🏗️ Arquitectura (Clean Code)

Se utilizó un enfoque basado en buenas prácticas:

```
Trigger → Handler → Service → Email Service
```
### 📡 Omni-Channel

Configuración para enrutar casos de forma inteligente:

### ⏱️ SLA con Entitlements & Milestones

Se implementaron SLA diferenciados:

| Prioridad | First Response | Resolution |
| --------- | -------------- | ---------- |
| Alta 🔴   | 30 min         | 4 horas    |
| Media 🟡  | 2 horas        | 8 horas    |
| Baja 🟢   | 8 horas        | 24 horas   |

✔ Seguimiento automático de tiempos
✔ Control de cumplimiento

---

### 💻 Lightning Web Component (LWC)

Componente visual integrado en el Case que muestra:

* 📋 Lista de milestones
* ⏳ Tiempo restante
* 🎨 Indicadores visuales:

  * Verde → En tiempo
  * Amarillo → Próximo a vencer
  * Rojo → Vencido

---

## 🧪 Pruebas

* Test Classes para validar la lógica de priorización
* Cobertura superior al 95%
* Validación de escenarios múltiples

---

## 🛠️ Tecnologías usadas

* Apex
* Lightning Web Components (LWC)
* Salesforce Service Cloud
* Omni-Channel
* Entitlements & Milestones

---

## 📷 Demo


---

## 💡 Autor

Desarrollado por **Ines Burbano**
Salesforce Developer ☁️

---

## ⭐ Notas finales

Este proyecto simula un escenario real de negocio y demuestra cómo Salesforce puede ser utilizado para:

✔ Automatizar procesos
✔ Mejorar la experiencia del usuario
✔ Garantizar cumplimiento de SLA
