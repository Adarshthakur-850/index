# Use Node.js base image (works for React, Node.js backend)
FROM node:18

# Set working directory
WORKDIR /app

# Copy dependency files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all source code
COPY . .

# Build the project (optional - for frontend like React)
RUN npm run build || echo "No build step, skipping..."

# Expose default port (adjust if needed)
EXPOSE 3000

# Start the app (React: serve or nginx, Node.js: npm start)
CMD ["npm", "start"]
