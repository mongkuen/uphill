class AddTimestampsToCheckins < ActiveRecord::Migration
  def change
    add_column :checkins, :created_at, :datetime
    add_column :checkins, :updated_at, :datetime
  end
end
