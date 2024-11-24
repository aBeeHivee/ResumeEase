# Use Node.js as the base image for the build stage
FROM node:20 AS build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app's code into the container
COPY . .

# Build the React app
RUN npm run build

# Use Nginx to serve the built React app
FROM nginx:alpine

# Copy the build output to Nginx's HTML folder
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 for the container
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
