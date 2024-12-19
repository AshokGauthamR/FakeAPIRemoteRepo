Feature: Airlines API - Negative scenario (Invalid ID)

  Scenario: Request with invalid ID
    Given url CONTEEXTURI
    And path '/airlines/14586'
    And header Authorization = 'Bearer ' + authInfo.authToken
    When method GET
    Then status 204
    * def responseTime = response.time
    And assert responseTime < 500
