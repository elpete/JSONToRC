component {

    this.name = "JSONToRC";
    this.author = "Eric Peterson";
    this.description = "Add the HTTP Request Body to the RC on each request";
    this.version = "1.0.0";

    function configure() {}

    function preProcess( event, interceptData, buffer, rc, prc ) {
        var jsonContent = event.getHTTPContent( json = true );

        if ( isArray( jsonContent ) ) {
            throw( "Only struct values are able to be converted. Please attach your array [#serializeJson( jsonContent )#] to a key in a struct." );
        }

        if ( isSimpleValue( jsonContent ) ) {
            throw( "Only struct values are able to be converted. Please attach your simple value [#jsonContent#] to a key in a struct." );
        }

        rc.append( jsonContent );
    }
}