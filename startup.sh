#!/bin/bash
set -e

echo "=== Iniciando hostal-os-pms API ==="
echo "Node: $(node --version)"

echo "=== Ejecutando migraciones ==="
cd /home/site/wwwroot
npx prisma migrate deploy --schema=apps/api/prisma/schema.prisma

echo "=== Estructura dist ==="
find apps/api/dist -name "server.js" 2>/dev/null || echo "server.js no encontrado"

echo "=== Arrancando API ==="
node apps/api/dist/server.js
