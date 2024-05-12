# Use a specific version of Node.js Alpine image
FROM node:20-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json, package-lock.json and tsconfig  to the working directory

COPY tsconfig.json ./
COPY package*.json ./

# Install dependencies
RUN npm ci
# Copy the entire project directory into the working directory
COPY . .
# Build the Next.js application
RUN npm run build
# Expose port 3000 to the outside world
EXPOSE 3000
# Command to run the Next.js application
CMD ["npm","run","dev"]

