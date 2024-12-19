Feature: Negative test scenario without authorization

  Scenario: Request without Authorization header
    Given url CONTEEXTURI
    And path '/passenger/:id'
    When method GET
    * def responseTime = response.time
    And assert responseTime < 500
    Then status 400
    And print response
    And match $.message == 'You must send an Authorization header'
