<cfscript>
// ...existing code...

// Define the path for the temporary JSON file
tempFilePath = expandPath("../../jsontemp/healthcheck.json");

// Check if the jsontemp directory exists
if (!directoryExists(expandPath("../../jsontemp"))) {
    // Create the directory if it doesn't exist
    DirectoryCreate(expandPath("../../jsontemp"));
}

// Attempt to write a temporary JSON file
try {
    fileWrite(tempFilePath, '{"status": "healthy"}');
    // If successful, delete the file
    fileDelete(tempFilePath);
    healthCheckResult = {
        "status": "healthy",
        "message": "File write and delete successful."
    };
} catch (any e) {
    healthCheckResult = {
        "status": "unhealthy",
        "message": "Error during file operations: " & e.message
    };
}

// Count the number of .json files in the jsontemp directory
jsonFileCount = arrayLen(directoryList(expandPath("../../jsontemp"), true, ".json"));

// Add the count to the health check result
healthCheckResult.jsonFileCount = jsonFileCount;

// Output the health check result as JSON
writeOutput(serializeJSON(healthCheckResult));

// ...existing code...
</cfscript>