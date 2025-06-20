@REQ_BTDR-004 @HU004 @update_character @bp_dev_test @Agente2 @E2 @iniciativa_marvel_characters
Feature: BTDR-004 Actualizar personaje (bp-dev-test)
  Background:
    * def result = call read('classpath:com/pichincha/features/utility/createCharacter.feature') {}
    * def characterId = result.id
    * print 'ID DEL PERSONAJE:', characterId
    * url port_bp_dev_test

  @id:1 @updateCharacter @success200
  Scenario Outline: T-API-BTDR-004-CA01-Actualizar personaje exitosamente 200 - karate
    * path username, 'api', 'characters', characterId
    Given request <jsonData>
    When method put
    Then status 200
    # And match response.description == <jsonData>.description
    # And match response.id == characterId

    Examples:
      | jsonData |
      | karate.read('classpath:data/bp_dev_test/characters_update.json')[0] |

  @id:2 @updateCharacter @notFound404
  Scenario: T-API-BTDR-004-CA02-Actualizar personaje no existente 404 - karate
    * def characterId = 99999
    * path username, 'api', 'characters', characterId
    * def jsonData = read('classpath:data/bp_dev_test/characters_update.json')[0]
    Given request jsonData
    When method put
    Then status 404
    # And match response.error == 'Character not found'

