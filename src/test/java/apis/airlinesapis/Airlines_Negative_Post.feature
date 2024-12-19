Feature: Airlines API - Negative scenario (No Authorization header)

  Scenario: Unauthorized request (no Authorization header)
    Given url CONTEEXTURI
    And path 'airlines'
    When method POST
    * def responseTime = response.time
    And assert responseTime < 500
    Then status 400
    And print response 
    And match $.message == 'You must send an Authorization header'
