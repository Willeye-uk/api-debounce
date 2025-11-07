<cfscript>

//find all files older than 5 minutes loop over and send to next hop
var dirPath = expandPath("/jsontemp/");
var files = directoryList(dirPath, false, "name", "*.json");
//var now = getTickCount();

try {

    for (var file in files) {
    var fileAgeMinutes = dateDiff("n", file.dateLastModified, now());
    if (fileAgeMinutes >= 5) {
        // Read file content
        var filePath = dirPath & "/" & file.name;
        var jsonData = fileRead(filePath);

        // Send data to next endpoint
        var httpService = new http();
        httpService.setMethod("POST");
        httpService.setUrl(application.nextHopUrl);
        httpService.addParam(type="formField", name="data", value=jsonData);
        httpService.addParam(type="formField", name="id", value=replace(file.name, ".json", "", "one"));
        var response = httpService.send().getPrefix();

        // If successful, delete the file
        if (response.statusCode == 200) {
            fileDelete(filePath);
        }
    }
}
    
} catch (all e) {

    // Log error
    writeLog(file="debounceAPI", text="Error processing files: " & e.message);
    
}

</cfscript>