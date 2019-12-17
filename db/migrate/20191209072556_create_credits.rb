class CreateCredits < ActiveRecord::Migration[5.0]
  def change
    create_table :credits do |t|
      t.integer   :card_number
      t.integer   :exp_month
      t.integer   :ep_year
      t.timestamps
    end
  end
end
