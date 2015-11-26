class Wine < ActiveRecord::Base
  def self.search(search)
    if search
      @wines = self.where("short_description LIKE ?", "%" + search + "%")
    else
      @wines = self.all
    end
  end
end

