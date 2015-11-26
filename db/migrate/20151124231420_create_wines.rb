class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :short_description
      t.string :bottle_size
      t.float :price
      t.string :long_description
      t.string :origin_country
      t.string :company
      t.string :grape_type
      t.boolean :is_vegetarian
      t.integer :picture_id

      t.timestamps null: false
    end
  end
end
