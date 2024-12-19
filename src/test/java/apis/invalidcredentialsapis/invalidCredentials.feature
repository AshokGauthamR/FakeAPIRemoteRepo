Feature: Test for authentication API with invalid credentials

  Scenario: Attempt to obtain access token with invalid credentials
    Given url AUTHURI
    And path 'token'
    And header Content-Type = 'application/x-www-form-urlencoded; charset=utf-8'
    And form field grant_type = GRANT_TYPE
    And form field username = USER_NAME
    And form field password = 'invalidpassword'
    And form field client_id = CLIENT_ID
    And form field scope = SCOPE
    When method post
    * def responseTime = response.time
    And assert responseTime < 500
    Then status 400
    And match $.error == 'invalid_grant'
    And match $.error_description == 'The credentials provided were invalid.'
