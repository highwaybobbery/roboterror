class AddWonLostToRobot < ActiveRecord::Migration
  def change
    add_column :robots, :won, :integer, null: false, default: 0
    add_column :robots, :lost, :integer, null: false, default: 0
  end
end
