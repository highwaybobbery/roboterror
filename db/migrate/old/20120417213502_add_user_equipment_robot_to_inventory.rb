class AddUserEquipmentRobotToInventory < ActiveRecord::Migration
  def change
   add_column :inventories, :user, :integer
   add_column :inventories, :equipment, :integer
   add_column :inventories, :robot, :integer
   add_column :inventories, :price, :integer
  end
end
