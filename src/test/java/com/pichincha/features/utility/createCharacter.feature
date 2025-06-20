# Feature de utilidad para crear personajes de prueba
# No usar para pruebas de negocio ni reportes, solo para preparación de datos
# Llama este feature con:
# * def result = call read('classpath:com/pichincha/features/utility/createCharacter.feature') {}
# El resultado tendrá el id del personaje creado en result.id

Feature: Utilidad para crear personaje de prueba

  Scenario: Crear personaje y devolver id
    * def characterData = read('classpath:data/bp_dev_test/characters_validos.json')[0]
    * print 'CHARACTER DATA:', characterData
    * def random = java.util.UUID.randomUUID() + ''
    * characterData.name = characterData.name + '-' + random
    * url port_bp_dev_test
    * path username, 'api', 'characters'
    * print 'REQUEST ENVIADO:', karate.pretty(characterData)
    Given request characterData
    When method post
    * print 'RESPONSE KARATE:', response
    Then status 201
    * def id = response.id
    * print 'ID CREADO:', id
