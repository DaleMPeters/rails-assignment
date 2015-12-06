class Basket < ActiveRecord::Base
  # Class representing the collection of items the customer
  # wants to buy. Represents a collection of BasketItem objects
  has_many :basket_items, dependent: :destroy
end
