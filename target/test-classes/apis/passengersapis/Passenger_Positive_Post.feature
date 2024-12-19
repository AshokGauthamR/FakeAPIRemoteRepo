Feature: Positive Test Scenario - With Authorization and Valid Payload

  Scenario Outline: Test API with Authorization Header and Valid JSON Payload
    Given url CONTEEXTURI
    And path 'passenger'
    And header Authorization = 'Bearer ' + authInfo.authToken
    * def requestPayload =
      """
      {
      "name": '<Name>',
      "trips": '<Trips>',
      "airline": '<Airline>'
      }
      """
    And request requestPayload
    And print requestPayload
    When method POST
    Then status 200
    * def responseTime = response.time
    And assert responseTime < 500
    And print response
    Then match $.name == '<Name>'

    Examples: 
      | Name             | Trips | Airline                              |
      | Haulmer Airlines |   247 | 66038402-402d-4a3f-baef-7cb5f53697a8 |
