class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :size
      t.string :status, null: false
      t.integer :price, null: false
      t.string :region, null: false
      t.integer :brand_id
      t.string :category_id
      t.references :buyer, foreign_key: { to_table: :users }
      t.references :seller, foreign_key: { to_table: :users }
      t.string :shipping_date, null: false
      t.string :shipping_fee, null: false
      t.string :shipping_method
      t.integer :profit
      t.timestamps
    end
  end

end
