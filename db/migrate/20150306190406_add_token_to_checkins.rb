class AddTokenToCheckins < ActiveRecord::Migration
  def change
    add_column :checkins, :token, :string
  end
end
