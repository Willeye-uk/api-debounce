# Debounce API

This project is a Lucee-based, containerized debouncing API that accepts POST requests, holds them for one minute, and if no further requests come in, sends the most recent JSON to a specified URL.

## Project Structure

```
debounce-api
├── Dockerfile
├── docker-compose.yml
├── Application.cfc
├── api
│   ├── index.cfm
│   └── debounce.cfc
├── helpers
│   └── RequestHandler.cfc
├── config
│   └── settings.json
└── README.md
```

## Setup Instructions

1. **Clone the repository**:
   ```bash
   git clone <repository-url>
   cd debounce-api
   ```

2. **Build the Docker image**:
   ```bash
   docker build -t debounce-api .
   ```

3. **Run the application using Docker Compose**:
   ```bash
   docker-compose up
   ```

## Usage

- Send a POST request to the API endpoint (e.g., `http://localhost:8080/api/index.cfm`) with the JSON data you want to debounce.
- The API will hold the request for one minute. If no further requests are received within that time, it will send the most recent JSON to the specified URL.

## Configuration

- Update the `config/settings.json` file to set the target URL for posting the JSON data and any other relevant parameters.

## Contributing

Feel free to submit issues or pull requests for improvements and bug fixes.

## License

This project is licensed under the MIT License.

Take request
write to file with name xkey
if file exists overright