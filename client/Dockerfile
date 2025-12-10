# FROM node:18.0.0-alpine

# # Set working directory
# WORKDIR /

# # Copy the package.json files
# COPY package*.json ./

# # Install dependencies
# RUN npm ci

# # Copy the rest of the frontend app
# COPY . .

# # Expose the port that React app runs on
# EXPOSE 3000

# # Start the React app
# CMD ["npm", "start"]


# client/Dockerfile
# Stage 1 — build
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

# Optional: copy a custom nginx config (if you have router / SPA fallback)
# COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
