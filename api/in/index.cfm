<cfscript>

if (isDefined('form.data') && isDefined('form.id')) {

    xKey = form.id;
    data = form.data;

    filePath = expandPath("/jsontemp/" & xKey & ".json");

    // Write data to file (overwrites if exists)
    fileWrite(filePath, data);

    // Return success response
    writeOutput(serializeJSON({status="success", message="Data received and stored."}));

} else {
    // Return error response
    writeOutput(serializeJSON({status="error", message="Missing 'data' or 'id' parameter."}));

}

</cfscript>