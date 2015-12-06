class BasketItem < ActiveRecord::Base
  # Class represents the link between a wine object and a basket object

  belongs_to :wine
  belongs_to :basket
end
