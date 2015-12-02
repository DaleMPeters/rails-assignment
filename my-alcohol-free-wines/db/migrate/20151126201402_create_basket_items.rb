class CreateBasketItems < ActiveRecord::Migration
  def change
    create_table :basket_items do |t|
      t.integer :wine_id
      t.integer :basket_id

      t.timestamps null: false
    end
  end
end
