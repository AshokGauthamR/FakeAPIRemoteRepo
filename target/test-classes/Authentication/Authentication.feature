Feature: Test for authentication API with valid credentials

  @Auth
  Scenario: Validating the authentication API response and storing access token
    Given url AUTHURI
    And path 'token'
    And header Content-Type = 'application/x-www-form-urlencoded; charset=utf-8'
    And form field scope = SCOPE
    And form field grant_type = GRANT_TYPE
    And form field username = USER_NAME
    And form field password = PASSWORD
    And form field client_id = CLIENT_ID
    When method POST
    * def responseTime = response.time
    Then status 200
    And assert responseTime < 500
    Then match $.token_type == 'Bearer'
    And match $.scope == 'offline_access'
    * def access_token = response.access_token
    * print 'Access Token: ' + access_token
