class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :size
      t.string :status, null: false
      t.integer :price, null: false
      t.integer :prefecture_id, null: false
      t.integer :brand_id
      t.integer :category_id
      t.integer :buyer_id
      t.integer :seller_id
      t.string :shipping_date, null: false
      t.string :shipping_method
      t.string :shipping_fee, null: false
      t.integer :profit
      t.timestamps
    end
  end

end
