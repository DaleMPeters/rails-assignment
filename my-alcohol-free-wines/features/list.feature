Feature: List_All_Wines
    As a customer
    I want to be able to list all wines in the database
    So that I can browse all the wines
    
    Scenario: List all wines
        Given we have the following wines:
            | short_description   | bottle_size | price | long_description               | origin_country | company       | grape_type | is_vegetarian | image_url | barcode |
            | A Lovely Greek Wine | Small       | 1.99  | Lovely and from Greece. Sweet. | Greece         | Bargain Wines | Chardonnay | false         | wine.jpg  | 091200  |
            | An Italian Wine     | Medium      | 9.99  | Wine made in Nago Torbole      | Italy          | Bargain Wines | Rose       | true          | wine.jpg  | 093333  |
            | An Australian Wine  | Medium      | 9.99  | Wine made in Nago Torbole      | Australian     | Bargain Wines | Rose       | true          | wine.jpg  | 093333  |
            | A French Wine       | Medium      | 9.99  | Wine made in Nago Torbole      | France         | Bargain Wines | Rose       | true          | wine.jpg  | 093333  |
            | A Belgian Wine      | Medium      | 9.99  | Wine made in Nago Torbole      | Belgium        | Bargain Wines | Rose       | true          | wine.jpg  | 093333  |
            | An Austrian Wine    | Medium      | 9.99  | Wine made in Nago Torbole      | Austria        | Bargain Wines | Rose       | true          | wine.jpg  | 093333  |
            | A Swiss Wine        | Medium      | 9.99  | Wine made in Nago Torbole      | Switzerland    | Bargain Wines | Rose       | true          | wine.jpg  | 093333  |
        When I visit the Wines Listings page
        Then the listings must be:
            | short_description   | bottle_size | price | long_description               | origin_country | company       | grape_type | is_vegetarian | image_url | barcode |
            | A Lovely Greek Wine | Small       | 1.99  | Lovely and from Greece. Sweet. | Greece         | Bargain Wines | Chardonnay | false         | wine.jpg  | 091200  |
            | An Italian Wine     | Medium      | 9.99  | Wine made in Nago Torbole      | Italy          | Bargain Wines | Rose       | true          | wine.jpg  | 093333  |
            | An Australian Wine  | Medium      | 9.99  | Wine made in Nago Torbole      | Australian     | Bargain Wines | Rose       | true          | wine.jpg  | 093333  |
            | A French Wine       | Medium      | 9.99  | Wine made in Nago Torbole      | France         | Bargain Wines | Rose       | true          | wine.jpg  | 093333  |
            | A Belgian Wine      | Medium      | 9.99  | Wine made in Nago Torbole      | Belgium        | Bargain Wines | Rose       | true          | wine.jpg  | 093333  |
            | An Austrian Wine    | Medium      | 9.99  | Wine made in Nago Torbole      | Austria        | Bargain Wines | Rose       | true          | wine.jpg  | 093333  |
            | A Swiss Wine        | Medium      | 9.99  | Wine made in Nago Torbole      | Switzerland    | Bargain Wines | Rose       | true          | wine.jpg  | 093333  |
