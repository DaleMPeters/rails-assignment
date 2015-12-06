Feature: Search
    As a customer
    I want to be able to search for wines by short_description
    So that I can find the wine I am interested in

    Scenario: Find Wines by short_description
        Given we have the following wines:
            | short_description   | bottle_size | price | long_description               | origin_country | company       | grape_type | is_vegetarian | image_url | barcode |
            | A Lovely Greek Wine | Small       | 1.99  | Lovely and from Greece. Sweet. | Greece         | Bargain Wines | Chardonnay | false         | wine.jpg  | 091200  |
            | An Italian Wine     | Medium      | 9.99  | Wine made in Nago Torbole      | Italy          | Bargain Wines | Rose       | true          | wine.jpg  | 093333  |
        When I search for Wine "Lovely"
        Then the results must be:
            | short_description   | bottle_size | price | long_description               | origin_country | company       | grape_type | is_vegetarian | image_url | barcode |
            | A Lovely Greek Wine | Small       | 1.99  | Lovely and from Greece. Sweet. | Greece         | Bargain Wines | Chardonnay | false         | wine.jpg  | 091200  |
