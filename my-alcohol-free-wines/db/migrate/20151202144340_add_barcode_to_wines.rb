class AddBarcodeToWines < ActiveRecord::Migration
  def change
    add_column :wines, :barcode, :string
  end
end
