@REQ_BTDR-001 @HU001 @get_all_characters @bp_dev_test @Agente2 @E2 @iniciativa_marvel_characters
Feature: BTDR-001 Obtener todos los personajes (bp-dev-test)
  Background:
    * url port_bp_dev_test
    * path username, 'api', 'characters'
    # El username es parametrizable para facilitar pruebas multiusuario

  @id:1 @getAllCharacters @success200
  Scenario: T-API-BTDR-001-CA01-Obtener todos los personajes exitosamente 200 - karate
    Given method get
    Then status 200
    # And match response == []
    # And match response[0].name != null
