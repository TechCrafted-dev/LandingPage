# TechCrafted.dev

[![Astro](https://img.shields.io/badge/-Astro-000?style=flat&logo=astro&logoColor=FF5D01)](#tecnologías)
[![Tailwind CSS](https://img.shields.io/badge/-Tailwind%20CSS-38B2AC?style=flat&logo=tailwind-css&logoColor=fff)](#tecnologías)
[![TypeScript](https://img.shields.io/badge/-TypeScript-3178C6?style=flat&logo=typescript&logoColor=fff)](#tecnologías)

TechCrafted.dev es un espacio personal —y PWA— dedicado a la tecnología, el desarrollo y las grandes ideas que merece la pena compartir. En él encontrarás un **blog** con tutoriales y proyectos, un **portafolio** y una sección de **noticias** curadas sobre programación.

**Demo en producción**: <https://techcrafted.dev>

---

## Índice

1. [Características](#características)
2. [Tecnologías](#tecnologías)
3. [Estructura del proyecto](#estructura-del-proyecto)
4. [Primeros pasos](#primeros-pasos)
5. [Scripts disponibles](#scripts-disponibles)
6. [Despliegue](#despliegue)
7. [Contribuir](#contribuir)
8. [Licencia](#licencia)

---

## Características

- Diseño **100 % responsivo** y mobile-first  
- **Tema oscuro / claro** con almacenamiento de preferencia en `localStorage`  
- Animaciones fluidas gracias a **GSAP**  
- Carga diferida y **optimización de imágenes** (WebP/AVIF)  
- Generación de **OG-Image** automática para social media  
- Configuración lista para **PWA**: icons, manifest y `service-worker`  
- Métricas de rendimiento **Lighthouse 90+** de serie  

---

## Tecnologías

| Principal | Styling | Animaciones | Tooling |
|-----------|---------|-------------|---------|
| **Astro 4** | **Tailwind CSS v3** | **GSAP v3** | PNPM • TypeScript • Prettier |

---

## Estructura del proyecto

```text
/                              #  Raíz del monorrepo Astro
├── public/                    #  Recursos estáticos (sirven 1:1)
│   ├── manifest.webmanifest
│   ├── og-image.jpg
│   └── icon_*x*.webp
│
├── src/
│   ├── assets/                #  Imágenes y fuentes optimizadas
│   ├── components/            #  Componentes compartidos (.astro / .tsx)
│   ├── layouts/               #  Plantillas de página
│   ├── pages/                 #  Rutas (blog, news, portfolio…)
│   └── styles/                #  Hoja global de Tailwind
│
└── package.json
```

---

## Primeros pasos

1. **Clona** el repositorio
   ```bash
   git clone https://github.com/TechCrafted-dev/LandingPage.git && cd techcrafted.dev
   ```
2. **Instala** las dependencias
   ```bash
   pnpm install
   ```
3. **Arranca** el servidor de desarrollo
   ```bash
   pnpm dev
   ```
4. Abre <http://localhost:4321> en tu navegador favorito.

> **Requisitos**: Node ≥ 18 LTS, PNPM ≥ 9.

---

## Scripts disponibles

| Comando          | Descripción                                          |
|------------------|------------------------------------------------------|
| `pnpm dev`       | Inicia el servidor de desarrollo con recarga en vivo |
| `pnpm build`     | Compila la versión optimizada para producción        |
| `pnpm preview`   | Sirve localmente la carpeta `dist/` generada         |

---

## Despliegue

El sitio se genera como **HTML estático** y puede desplegarse en cualquier CDN o plataforma serverless (Vercel, Netlify, Cloudflare Pages…).  
Para un flujo CI/CD rápido en **Vercel**:

1. Importa el repositorio.
2. Selecciona _Framework Preset → Astro_.
3. Establece `pnpm install` y `pnpm build` como pasos de build (se detectan automáticamente).
4. **Deploy** y listo — Vercel manejará el cacheo estático global.

---

## Contribuir

¡Se aceptan PRs! Antes de enviar tu propuesta:

1. Crea un issue describiendo el cambio o feature.
2. Asegúrate de pasar `pnpm lint` y `pnpm test` (cuando existan tests).
3. Usa _commits_ con convenciones `feat:`, `fix:`, `docs:` etc.

---

## Licencia

Distribuido bajo la licencia **MIT**. Consulta `LICENSE` para más información.

---

<p align="center">
  Hecho con 🤍 por <a href="https://techcrafted.dev">Sergio Trujillo de la Nuez</a>
</p>
