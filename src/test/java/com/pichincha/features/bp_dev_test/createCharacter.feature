@REQ_BTDR-003 @HU003 @create_character @bp_dev_test @Agente2 @E2 @iniciativa_marvel_characters
Feature: BTDR-003 Crear personaje (bp-dev-test)
  Background:
    * url port_bp_dev_test
    * path username, 'api', 'characters'

  @id:1 @createCharacter @success201
  Scenario Outline: T-API-BTDR-003-CA01-Crear personaje exitosamente 201 - karate
    * def jsonData = <jsonData>
    * print 'CHARACTER DATA:', jsonData
    * def random = java.util.UUID.randomUUID() + ''
    * set jsonData.name = jsonData.name + '-' + random
    Given request jsonData
    When method post
    Then status 201
    # And match response.name == jsonData.name
    # And match response.id != null
    
    Examples:
      | jsonData |
      | karate.read('classpath:data/bp_dev_test/characters_validos.json')[0] |
      | karate.read('classpath:data/bp_dev_test/characters_validos.json')[1] |

  @id:2 @createCharacter @duplicate400
  Scenario: T-API-BTDR-003-CA02-Crear personaje con nombre duplicado 400 - karate
    * def jsonData = read('classpath:data/bp_dev_test/characters_duplicados.json')[0]
    Given request jsonData
    When method post
    Then status 400
    # And match response.error == 'Character name already exists'

  @id:3 @createCharacter @invalid400
  Scenario: T-API-BTDR-003-CA03-Crear personaje con datos inválidos 400 - karate
    * def jsonData = read('classpath:data/bp_dev_test/characters_invalidos.json')[0]
    Given request jsonData
    When method post
    Then status 400
    # And match response.name == 'Name is required'
    # And match response.alterego == 'Alterego is required'
