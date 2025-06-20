@REQ_BTDR-002 @HU002 @get_character_by_id @bp_dev_test @Agente2 @E2 @iniciativa_marvel_characters
Feature: BTDR-002 Obtener personaje por ID (bp-dev-test)
  Background:
    * def result = call read('classpath:com/pichincha/features/utility/createCharacter.feature') {}
    * def characterId = result.id
    * url port_bp_dev_test

  @id:1 @getCharacterById @success200
  Scenario: T-API-BTDR-002-CA01-Obtener personaje por ID exitosamente 200 - karate
    * path username, 'api', 'characters', characterId
    Given method get
    Then status 200
    # And match response.id == characterId
    # And match response.name != null

  @id:2 @getCharacterById @notFound404
  Scenario: T-API-BTDR-002-CA02-Obtener personaje por ID no existente 404 - karate
    * def characterId = 99999
    * path username, 'api', 'characters', characterId
    Given method get
    Then status 404
    # And match response.error == 'Character not found'
