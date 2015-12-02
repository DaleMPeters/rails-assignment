class RemovePictureIdFromWines < ActiveRecord::Migration
  def change
    remove_column :wines, :picture_id, :int
  end
end
