class AddDefaultValueForUserBalance < ActiveRecord::Migration
  def up
    change_column :users, :balance, :integer, :default => 1000
  end

  def down
    change_column :users, :balance, :integer, :default => nil
  end
end
