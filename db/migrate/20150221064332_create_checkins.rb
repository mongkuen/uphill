class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.string :status
      t.integer :goal_id 
    end
  end
end
