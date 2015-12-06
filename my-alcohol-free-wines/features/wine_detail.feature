Feature: View_Wine_Detail
    As a customer
    I want to be able to click on a wine photo
    So that I can see the detail on the wine
    Scenario: Display detail
        Given we have the following wines:
            | short_description   | bottle_size | price | long_description               | origin_country | company       | grape_type | is_vegetarian | image_url | barcode |
            | An Austrian Wine    | Medium      | 9.99  | Wine made in Nago Torbole      | Austria        | Bargain Wines | Rose       | true          | wine.jpg  | 093333  |
        When I visit the Wines Listings page and click on the image for "An Australian Wine"
        Then the page must contain:
            | short_description   | bottle_size | price | long_description               | origin_country | company       | grape_type | is_vegetarian | image_url | barcode |
            | An Austrian Wine    | Medium      | 9.99  | Wine made in Nago Torbole      | Austria        | Bargain Wines | Rose       | true          | wine.jpg  | 093333  |
