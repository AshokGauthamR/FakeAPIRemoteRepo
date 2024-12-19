Feature: Negative test scenario with authorization but invalid passenger id

  Scenario: Request with Authorization but invalid passenger ID
    Given url CONTEEXTURI
    And path '/passenger/14586'
    And header Authorization = 'Bearer ' + authInfo.authToken
    When method GET
    Then status 204
    * def responseTime = response.time
    And assert responseTime < 500
