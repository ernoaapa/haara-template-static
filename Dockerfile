# Multi-stage Dockerfile: the `dev` target is what the platform runs in
# development mode (source is volume-mounted from the PVC, Vite serves it
# with live reload); the default/final stage is the image Shipwright builds
# for prod.

FROM node:alpine AS dev
EXPOSE 3000
# Vite dev server: watches HTML/CSS/JS for changes and triggers full-reload
# over WebSocket. Vite's injected HMR client auto-detects the page protocol
# (ws:// vs wss://) based on window.location.protocol — works correctly when
# the app is served through a TLS-terminating proxy.
CMD ["npx", "--yes", "vite", "--host", "0.0.0.0", "--port", "3000"]

FROM nginx:alpine
EXPOSE 80
COPY . /usr/share/nginx/html
