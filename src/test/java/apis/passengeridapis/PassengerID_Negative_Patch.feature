Feature: Test PATCH API without Authorization Header

  Scenario: Test PATCH API without Authorization Header
    Given url CONTEEXTURI
    And path '/passenger/:id'
    When method PATCH
    * def responseTime = response.time
    And assert responseTime < 500
    Then status 400
    And print response
    And match $.message == 'You must send an Authorization header'
