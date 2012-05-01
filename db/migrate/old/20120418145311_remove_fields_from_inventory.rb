class RemoveFieldsFromInventory < ActiveRecord::Migration
  def change
    remove_column :inventories, :user
    remove_column :inventories, :robot
    remove_column :inventories, :equipment
  end
end
