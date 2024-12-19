Feature: Airlines API - Positive scenario (With Authorization header and valid payload)

  Scenario: Authorized request with valid payload
    Given url CONTEEXTURI
    And path 'airlines'
    And header Authorization = 'Bearer ' + authInfo.authToken
    And request airlinesPayload
    When method POST
    Then status 200
    * def responseTime = response.time
    And assert responseTime < 500
    And match $._id != null
