class AddNotifyToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :notify, :boolean
  end
end
