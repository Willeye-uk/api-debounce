
FROM lucee/lucee:latest

# Set the working directory
WORKDIR /var/www

ENV LUCEE_LOGGING_FORCE_APPENDER=console
ENV LUCEE_LOGGING_FORCE_LEVEL=info
# Copy the application files into the container
COPY . .

COPY ./.CFConfig.json /opt/lucee/server/lucee-server/deploy/.CFConfig.json
# Expose the port the app runs on
EXPOSE 8080

# Start the Lucee server
CMD ["catalina.sh", "run"]