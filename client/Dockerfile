FROM node:18-alpine AS builder
WORKDIR /app

# Install dependencies (only package.json layer cached)
COPY package*.json ./
RUN npm ci

# Copy sources and build
COPY . .
RUN npm run build

# Stage 2 — serve with nginx
FROM nginx:alpine

# Remove default nginx content
RUN rm -rf /usr/share/nginx/html/*

# Copy built static files
COPY --from=builder /app/build /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
