# Multi-stage Dockerfile: the `dev` target is what the platform runs in
# development mode (source is volume-mounted from the PVC, live reload via
# zappp); the default/final stage is the image Shipwright builds for prod.

FROM node:alpine AS dev
EXPOSE 3000
# zappp serves the mounted source with WebSocket-based live reload.
# See https://github.com/iamovi/zappp
CMD ["npx", "--yes", "zappp", ".", "--no-browser", "-p", "3000"]

FROM nginx:alpine
EXPOSE 80
COPY . /usr/share/nginx/html
