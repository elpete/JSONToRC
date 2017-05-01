component extends="tests.resources.ModuleIntegrationSpec" appMapping="/app" {
    function run() {
        describe( "JSONToRC", function() {
            it( "adds json values in the http request data to the rc", function() {
                var json = {
                    name = "Eric",
                    age = 21
                };

                prepareMock( getRequestContext() )
                    .$( "getHTTPContent" )
                    .$args( json = true )
                    .$results( json );

                var event = execute( event = "Main.index", renderResults = true );
                var rc = event.getCollection();

                expect( rc ).toHaveKey( "name" );
                expect( rc.name ).toBe( "Eric" );
                expect( rc ).toHaveKey( "age" );
                expect( rc.age ).toBe( 21 );
            } );

            describe( "helpful error messages", function() {
                it( "provides a helpful error message when just a simple value is passed as the request body", function() {
                    var json = "foo";

                    prepareMock( getRequestContext() )
                        .$( "getHTTPContent" )
                        .$args( json = true )
                        .$results( json );

                    expect( function() {
                        execute( event = "Main.index", renderResults = true );
                    } ).toThrow( regex = "Only struct values are able to be converted\. Please attach your simple value \[foo\] to a key in a struct." );
                } );

                it( "provides a helpful error message when just an array is passed as the request body", function() {
                    var json = [ "foo", "bar" ];

                    prepareMock( getRequestContext() )
                        .$( "getHTTPContent" )
                        .$args( json = true )
                        .$results( json );

                    expect( function() {
                        execute( event = "Main.index", renderResults = true );
                    } ).toThrow( regex = "Only struct values are able to be converted\. Please attach your array \[\[\""foo\"",\""bar\""\]\] to a key in a struct." );
                } );
            } );
        } );
    }
}