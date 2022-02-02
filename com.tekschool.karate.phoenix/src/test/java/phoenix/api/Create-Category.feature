Feature: create category

  Background: 
    Given url 'https://tekschool-api-test.azurewebsites.net'
    * header Authorization = call read('basic-auth.js') { username: 'tekschool', password: 'admin' }

  @createCategory
  Scenario: creating a new category using the post call and vericitaion
    Given path '/api/v1/category/save'
    When request
      """
      {
      "categoryName": "Demo Category in Class",
      "new": true
      }
      """
    And method post
    Then status 200
    And print response
    * def idValue = response.id
    And print idValue
    * path '/api/v1/category'
    * param id = idValue
    And print response
    And match idValue == response.id
    
    