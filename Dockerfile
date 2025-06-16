# syntax=docker/dockerfile:1

############################
# Stage 1 – Build the site #
############################
FROM node:20-alpine AS builder

# System settings
WORKDIR /app

# Install dependencies
COPY package*.json package-lock*.json ./

# Usamos 'npm install' para instalar dependencias.
RUN npm install

# Copy the rest of the project files
COPY . .

# Build the Astro project (outputs to /app/dist)
RUN npx astro build

####################################
# Stage 2 – Production web server  #
####################################
FROM nginx:1.27-alpine AS production

# Remove default site definition supplied by the base image
RUN rm /etc/nginx/conf.d/default.conf

# Copy our custom Nginx virtual‑host configuration
COPY nginx/site.conf /etc/nginx/conf.d/

# Copy the static build produced by Astro
COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 80

# Launch Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
