Feature: Airlines API - Positive scenario

  Scenario: Authorized request with token
    Given url CONTEEXTURI
    And path 'airlines'
    And header Authorization = 'Bearer ' + authInfo.authToken
    When method GET
    Then status 200
    * def responseTime = response.time
    And assert responseTime < 500
    And print response
    And match response[11]._id == '00cad03a-a19f-407c-a334-6fce979fd1e3'
    And match response[11].name == 'Sri Lankan Airways'
    And match response[11].country == 'Sri Lanka'
    And match response[11].head_quaters == 'Katunayake, Sri Lanka'
