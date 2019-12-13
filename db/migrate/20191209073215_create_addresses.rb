class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string   :postcode,                       null: false
      t.integer  :prefeture
      t.string   :city
      t.string   :block
      t.string   :building

      t.timestamps
    end
  end
end
