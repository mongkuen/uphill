class AddTitleAndScheduleToGoalsAgain < ActiveRecord::Migration
  def change
    add_column :goals, :title, :string
    add_column :goals, :schedule, :string
  end
end
