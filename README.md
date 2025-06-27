# TechCrafted.dev

Sitio web personal dedicado a la tecnología, el desarrollo y grandes ideas que merecen compartirse.

##️ Tecnologías

- Astro
- Tailwind CSS
- TypeScript
- GSAP (Animaciones)

## Estructura del Proyecto

```text
/
├── public/
│   ├── icon_48x48.webp
│   ├── icon_180x180.webp
│   ├── icon_192x192.webp
│   ├── icon_512x512.webp
│   ├── manifest.webmanifest
│   └── og-image.jpg
├── src/
│   ├── assets/
│   │   ├── background.webp
│   │   └── logo.webp
│   ├── components/
│   │   └── ThemeToggle.astro
│   ├── layouts/
│   │   └── Layout.astro
│   ├── pages/
│   │   ├── index.astro
│   │   ├── blog/
│   │   ├── news/
│   │   └── portfolio/
│   └── styles/
│       └── global.css
└── package.json
```

## Comandos
```shell
pnpm install # Instala dependencias
```
```shell
pnpm dev # Inicia servidor de desarrollo en localhost:4321
```
```shell
pnpm build # Construye el sitio para producción en ./dist/
```
```shell
pnpm preview # Previsualiza la build localmente
```

## Características
- Diseño responsivo
- Modo oscuro/claro
- Animaciones suaves con GSAP
- Optimización de imágenes
- Meta tags para redes sociales