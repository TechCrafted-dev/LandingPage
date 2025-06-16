# build stage
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# serve stage
FROM node:20-alpine
WORKDIR /app

# Copiamos solo los archivos necesarios para servir
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/package*.json ./
RUN npm install --production

# Configurar variable de entorno para permitir techcrafted.dev como host
ENV __VITE_ADDITIONAL_SERVER_ALLOWED_HOSTS=techcrafted.dev

EXPOSE 4321

# Servir la app con Astro preview, aceptando conexiones externas
CMD ["npx", "astro", "preview", "--port", "4321", "--host", "0.0.0.0"]
