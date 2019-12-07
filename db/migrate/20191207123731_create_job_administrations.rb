class CreateJobAdministrations < ActiveRecord::Migration[5.0]
  def change
    create_table :job_administrations do |t|

      t.timestamps
    end
  end
end
