component {

    this.name = "JSONToRC";
    this.author = "Eric Peterson";
    this.description = "Add the HTTP Request Body to the RC on each request";
    this.version = "1.0.0";

    function configure() {}

    function preProcess( event, interceptData, buffer, rc, prc ) {
        var jsonContent = event.getHTTPContent( json = true );
        if ( ! isSimpleValue( jsonContent ) ) {
            rc.append( jsonContent );
        }
    }
}