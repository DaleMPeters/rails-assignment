class Wine < ActiveRecord::Base
  has_many :basket_items
  before_destroy :has_no_line_item_references?

  def self.search(search)
    if search
      @wines = self.where("short_description LIKE ?", "%" + search + "%")
    else
      @wines = self.all
    end
  end

  private
    def has_no_line_item_references?
      if basket_items.empty?
        return true
      end
      errors.add(:base, 'This product is in someone\'s cart, cannot destroy')
      return false
    end
  #end
end

