Feature: End to End Testing for Rest Api using Karate

  Background: 
    Given url 'https://tekschool-api-test.azurewebsites.net'
    * header Authorization = call read('basic-auth.js') { username: 'tekschool', password: 'admin' }

  Scenario: End to End API test of all methods
    Given path '/api/v1/product/save'
    When request
      """
      {
      "productName": "apple",
      "category": {
      "id": 1,
      "categoryName": "electronic",
      "new": false
      },
      "basePrice": 100,
      "new": true
      
      }
      """
    And method post
    And print response
    * def id = response.id
    * path '/api/v1/product/'+ id
    When method get
    Then status 200
    And print response
    * path '/api/v1/product/'+ id
    When method delete
    And print response
    
