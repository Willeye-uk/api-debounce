
FROM lucee/lucee:latest

# Set the working directory
WORKDIR /var/www

# Copy the application files into the container
COPY . .

# Expose the port the app runs on
EXPOSE 8080

# Start the Lucee server
CMD ["catalina.sh", "run"]