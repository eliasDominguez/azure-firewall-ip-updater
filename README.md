# 🔐 Actualizador de IP para Reglas de Firewall en Azure SQL

Este script permite actualizar automáticamente la IP pública de tu máquina en las reglas de firewall de un servidor SQL en Azure. Es útil para desarrolladores que trabajan desde redes con IP dinámica y necesitan acceso frecuente sin usar VPN.

## 🚀 ¿Cómo funciona?

- Detecta tu IP pública actual.
- Crea (o actualiza) una regla de firewall en Azure SQL Server para permitir el acceso desde tu IP.
- Opcionalmente, puedes guardar la IP anterior para evitar actualizaciones innecesarias.

## 📦 Requisitos

- Tener instalado [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli).
- Autenticarse previamente con `az login`.
- Conocer el nombre del servidor SQL y del grupo de recursos en Azure.

## 🛠️ Uso

```bash
 ./actualizar-firewall-nueva-ip.bash
