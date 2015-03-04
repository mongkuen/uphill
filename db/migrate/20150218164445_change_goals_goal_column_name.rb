class ChangeGoalsGoalColumnName < ActiveRecord::Migration
  def change
    remove_column :goals, :goal
    add_column :goals, :body, :string
  end
end
