Feature: Positive test scenario with valid passenger id

  Scenario: Request with Authorization and valid passenger ID
    Given url CONTEEXTURI
    And path '/passenger/667b9b617ad8fb437543680d'
    And header Authorization = 'Bearer ' + authInfo.authToken
    When method GET
    Then status 200
    * def responseTime = response.time
    And assert responseTime < 500
    And print response
    And match $._id == '667b9b617ad8fb437543680d'
    And match $.name == 'Bob Smith'
    And match $.airline[0]._id == '4238ae44-2014-4f13-be27-128a5cb83b38'
    And match $.airline[0].name == 'Boom Boom Airline'
