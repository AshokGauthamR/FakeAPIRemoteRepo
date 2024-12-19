Feature: Test DELETE API with Authorization Header

  Scenario: Test API with Authorization Header and Valid Passenger ID
    Given url CONTEEXTURI
    And path '/passenger/667ab7637ad8fb9a144343b1'
    And header Authorization = 'Bearer ' + authInfo.authToken
    When method DELETE
    Then status 200
    * def responseTime = response.time
    And assert responseTime < 500
    And match $.message == 'Passenger data deleted successfully.'
