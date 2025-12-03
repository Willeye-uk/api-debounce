component {
    this.name = "debounceAPI";
    this.applicationTimeout = createTimeSpan(0,2,0,0);
    this.sessionManagement = false;
    this.nextHopUrl = "http://127.0.0.1:5000/api"; 
    this.ramStorePath = 'ram://debounceAPI/';
    this.localStorePath = getTempDirectory() & "debounceAPI" & "/";
    this.useRedis = false; // set to true to use Redis for storage
    this.useRam = true; // set to true to use RAM for storage
    
    function onApplicationStart() {
        return true;
    }
}