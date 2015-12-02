class AddImageUrlToWines < ActiveRecord::Migration
  def change
    add_column :wines, :image_url, :string
  end
end
