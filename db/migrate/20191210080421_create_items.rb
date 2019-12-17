class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :size
      t.string :status
      t.string :method
      t.string :date
      t.integer :price
      t.integer :prefecture_id
      t.integer :brand_id
      t.integer :category_id
      t.integer :user_id
      t.string :shipping_date
      t.string :shipping_method
      t.string :shipping_fee
      t.integer :profit
      t.timestamps
    end
  end

end
© 2019 GitHub, Inc.