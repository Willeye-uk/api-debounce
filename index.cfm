<cfscript>
application.storePath = 'ram://debounceAPI/';
if (!directoryExists(application.storePath))
    directoryCreate(application.storePath);
    myFilePath = application.storePath & "susi#randrange(1,2000)#.txt";
    fileWrite(myFilePath, "hallo");
    dump(fileRead(myFilePath));
    dump(directoryList(application.storePath));

</cfscript>