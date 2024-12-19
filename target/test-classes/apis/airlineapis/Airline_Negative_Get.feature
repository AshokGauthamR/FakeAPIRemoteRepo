Feature: Negative Test for API without Authorization Header

  Scenario: Test without Authorization Header
    Given url CONTEEXTURI
    And path 'airlines'
    When method GET
    * def responseTime = response.time
    And assert responseTime < 500
    Then status 400
    And print response 
    And match $.message == 'You must send an Authorization header'
