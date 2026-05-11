#!/bin/bash
set -e

echo "=== Iniciando hostal-os-pms API ==="
echo "Node: $(node --version)"

echo "=== Ejecutando migraciones ==="
cd /home/site/wwwroot
npx prisma migrate deploy --schema=apps/api/prisma/schema.prisma

echo "=== Arrancando API ==="
node apps/api/dist/src/server.js
