class AddTitleAndScheduleToGoals < ActiveRecord::Migration
  def change
    add_column :users, :title, :string
    add_column :users, :schedule, :string
  end
end
