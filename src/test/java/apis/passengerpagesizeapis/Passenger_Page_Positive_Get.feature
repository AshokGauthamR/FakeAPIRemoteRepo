Feature: Positive Test Scenario - With Authorization Header

  Scenario: Test API with Authorization Header
    Given url CONTEEXTURI
    And path 'passenger'
    And param page = 0
    And param size = 10
    And header Authorization = 'Bearer ' + authInfo.authToken
    When method GET
    Then status 200
    * def responseTime = response.time
    And assert responseTime < 500
    And print response
    * def passengerCount = response.data.length
    * print 'Passenger count: ' + passengerCount
    * match passengerCount == 10
