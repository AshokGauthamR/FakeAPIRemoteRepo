Feature: Negative Test Scenario - Without Authorization Header

  Scenario: Attempt to delete passenger without Authorization header
    Given url CONTEEXTURI
    And path '/passenger/:id'
    When method DELETE
    * def responseTime = response.time
    And assert responseTime < 500
    Then status 400
    And print response
    And match $.message == 'You must send an Authorization header'
