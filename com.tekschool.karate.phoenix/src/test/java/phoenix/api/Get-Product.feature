Feature: Retrieve Product

  Background: 
    Given url 'https://tekschool-api-test.azurewebsites.net'
    * header Authorization = call read('basic-auth.js') { username: 'tekschool', password: 'admin' }

  @getProduct
  Scenario: get product by Id
    Given path '/api/v1/product/86'
    When method get
    Then status 200
    And print response
    * def id = response.id
    * print 'created id is: ', id
    * match id == 86
    * def productName = response.productName
    * match productName contains 'string'

  Scenario: get all product
    Given path '/api/v1/product/all'
    When method get
    Then status 200
    And print response
