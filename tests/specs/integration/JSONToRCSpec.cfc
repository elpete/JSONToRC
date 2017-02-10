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
        } );
    }
}