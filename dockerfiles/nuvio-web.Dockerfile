FROM node:22-alpine

WORKDIR /app

# Install dependencies
COPY package.json package-lock.json* ./
RUN npm ci

# Copy source code and build
COPY . .
RUN npm run build

# Expose the default Vite preview port (usually 4173, check your Vite config)
EXPOSE 4180

# Start the Vite preview server
CMD ["npm", "run", "preview"]
