class BasketItem < ActiveRecord::Base
  # adapted from agile web development with rails
  belongs_to :wine
  belongs_to :basket
end
