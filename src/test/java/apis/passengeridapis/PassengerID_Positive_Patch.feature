Feature: Test PATCH API with Authorization Header and Valid Payload

  Scenario: Test PATCH API with Authorization Header, Valid Passenger ID, and Valid JSON Payload
    Given url CONTEEXTURI
    And path '/passenger/667ab7677ad8fb440f4343c5'
    And header Authorization = 'Bearer ' + authInfo.authToken
    * def passengerPaylod = read('classpath:PassengerPayload.json')
    And request passengerPaylod
    When method PATCH
    Then status 200
    * def responseTime = response.time
    And assert responseTime < 500
    And print response
    And match $.message == 'Passenger data updated successfully.'
