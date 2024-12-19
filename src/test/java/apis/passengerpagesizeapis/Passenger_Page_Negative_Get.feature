Feature: Negative Test Scenario - Missing Authorization Header

  Scenario: Test API without Authorization Header
    Given url CONTEEXTURI
    And path 'passenger'
    And param page = 0
    And param size = 10
    When method GET
    * def responseTime = response.time
    And assert responseTime < 500
    Then status 400
    And print response
    And match $.message == 'You must send an Authorization header'