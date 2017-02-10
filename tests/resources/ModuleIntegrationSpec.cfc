component extends="coldbox.system.testing.BaseTestCase" {

    /**
    * @beforeAll
    */
    function registerModuleUnderTest() {
        getController().getModuleService()
            .registerAndActivateModule( "JSONToRC", "testingModuleRoot" );
    }

    /**
    * @beforeEach
    */
    function setupIntegrationTest() {
        setup();
    }

}