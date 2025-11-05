component {
    this.name = "debounceAPI";
    this.applicationTimeout = createTimeSpan(0,2,0,0);
    this.sessionManagement = false;
    this.nextHopUrl = "http://127.0.0.1:5000/api"; 
    
    function onApplicationStart() {
        return true;
    }
}