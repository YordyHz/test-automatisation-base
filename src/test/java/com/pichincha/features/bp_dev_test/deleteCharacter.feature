@REQ_BTDR-005 @HU005 @delete_character @bp_dev_test @Agente2 @E2 @iniciativa_marvel_characters
Feature: BTDR-005 Eliminar personaje (bp-dev-test)
  Background:
    * def result = call read('classpath:com/pichincha/features/utility/createCharacter.feature') {}
    * def characterId = result.id
    * print 'ID DEL PERSONAJE:', characterId
    * url port_bp_dev_test

  @id:1 @deleteCharacter @success204
  Scenario: T-API-BTDR-005-CA01-Eliminar personaje exitosamente 204 - karate
    * path username, 'api', 'characters', characterId
    Given method delete
    Then status 204
    # And match response == ''
    # Limpieza de datos: el personaje ya es eliminado aquí

  @id:2 @deleteCharacter @notFound404
  Scenario: T-API-BTDR-005-CA02-Eliminar personaje no existente 404 - karate
    * def characterId = 99999
    * url port_bp_dev_test
    * path username, 'api', 'characters', characterId
    Given method delete
    Then status 404
    # And match response.error == 'Character not found'
