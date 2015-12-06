class Wine < ActiveRecord::Base
  # Class to represent a Wine that can be sold by MAF

  # Each wine object can be in more than one basket
  has_many :basket_items
  
  # Method to search the wines in the wines table for wines that meet the
  # query passed in (from the user, supplied at view level), either exactly or partially.
  def self.search(search_query)
    # If a search query was given, look for all wines that have a short_description
    # containing the search query.
    if search_query
      # Use SQL WHERE query to search for wines that partially or fully match
      # the search query given by the user
      @wines = self.where("short_description LIKE ?", "%" + search_query + "%")
    else
      # If no search query was given, just return all the wines
      @wines = self.all()
    end
  end
end
