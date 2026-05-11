#!/bin/bash
# Script de inicio para Azure App Service
# Se ejecuta desde la raíz del repositorio desplegado

set -e

echo "=== Iniciando hostal-os-pms API ==="
echo "Node version: $(node --version)"
echo "NPM version: $(npm --version)"

# Ejecutar migraciones de Prisma antes de arrancar
echo "=== Ejecutando migraciones de base de datos ==="
cd apps/api
npx prisma migrate deploy
cd ../..

# Iniciar la API
echo "=== Arrancando API ==="
node apps/api/dist/server.js
