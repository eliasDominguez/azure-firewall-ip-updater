#!/bin/bash
# ESTE SCRIPT LE ASIGNA EL IP EN LAS REGLAS DE FIREWALL PARA TENER ACCESO A LA BASE DE DATOS.
# RECORDAR QUE SE DEBE ACUTENTICAR CON: az login
# Y TENER EL CLI DE AZURE
# PARA CONSULTAR NOMBRE DEL SERVIDOR EJECUTAR: az sql server list --query "[].{Name:name}" --output table
# PARA CONSULTAR NOMBRE DEL GRUPO EJECUTAR: az group list --query "[].{Name:name}" --output table

# 🔧 Configuración
NOMBRE_DEL_SERVIDOR="[NOMBRE_SERVIDOR]"
NOMBRE_DEL_GRUPO="[NOMBRE_GRUPO]"
NOMBRE_REGLA="[NOMBRE_REGLA]"
# ARCHIVO_IP=".ip_actual.txt"

# Obtener IP actual
IP_NUEVA=$(curl -s https://api.ipify.org)


# Actualizar firewall (sin eliminar)
echo "🚀 Actualizando firewall con nueva IP: $IP_NUEVA"
az sql server firewall-rule create \
  --resource-group "$NOMBRE_DEL_GRUPO" \
  --server "$NOMBRE_DEL_SERVIDOR" \
  --name "$NOMBRE_REGLA" \
  --start-ip-address "$IP_NUEVA" \
  --end-ip-address "$IP_NUEVA"

# Guardar IP
# echo "$IP_NUEVA" > "$ARCHIVO_IP"

echo "✔️ Firewall actualizado con IP $IP_NUEVA"
