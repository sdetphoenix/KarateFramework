Feature: Create product

  Background: 
    Given url 'https://tekschool-api-test.azurewebsites.net'
    * header Authorization = call read('basic-auth.js') { username: 'tekschool', password: 'admin' }

  Scenario: Create one product
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
    Then status 200
    And print response
    
    
@create
  Scenario Outline: Create multiple products
    Given path '/api/v1/product/save'
    When request
      """
      {
      "productName": "<productName>",
      "category": {
      "id": "<idValue>",
      "categoryName": "<categoryValue>",
      "new": false
      },
      "basePrice": "<price>",
      "new": true
      
      }
      """
    And method post
    And print response
    
    Examples:
    |productName|idValue|categoryValue|price|
    |iphone|1|smart phone|800|
    |galaxy|1|smart phone|800|
    |Nokia|1|smart phone|800|
    
