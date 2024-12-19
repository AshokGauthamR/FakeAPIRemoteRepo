Feature:  Airlines API - Positive scenario (Valid ID)

  Scenario: Request with valid ID
    Given url CONTEEXTURI
    And path '/airlines/14586fb9-3b53-4d47-b897-6e0522a3c618'
    And header Authorization = 'Bearer ' + authInfo.authToken
    When method GET
    Then status 200
    * def responseTime = response.time
    And assert responseTime < 500
    And match $._id == '14586fb9-3b53-4d47-b897-6e0522a3c618'
    And match $.name == 'British Airways'
    And match $.country == 'United Kingdom'
    And match $.head_quaters == 'London, England'
