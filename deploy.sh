#!/bin/bash

APP_NAME="techcrafted"
PORT=4321

echo "Deteniendo contenedor existente..."
docker stop $APP_NAME 2>/dev/null && docker rm $APP_NAME 2>/dev/null

echo "Construyendo nueva imagen..."
docker build -t $APP_NAME .

echo "Iniciando contenedor..."
docker run -d -p $PORT:80 --name $APP_NAME $APP_NAME

echo "Despliegue completo en http://10.0.10.10:$PORT"
