class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :goal
      t.integer :user_id
      t.timestamps
    end
  end
end
