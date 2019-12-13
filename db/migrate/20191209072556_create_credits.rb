class CreateCredits < ActiveRecord::Migration[5.0]
  def change
    create_table :credits do |t|
      t.integer   :card_number,  null: false, unique: true
      t.integer   :exp_month,  null: false, unique: true
      t.integer   :ep_year,  null: false, unique: true
      t.timestamps
    end
  end
end
