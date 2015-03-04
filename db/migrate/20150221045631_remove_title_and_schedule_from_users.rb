class RemoveTitleAndScheduleFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :title, :string
    remove_column :users, :schedule, :string
  end
end
