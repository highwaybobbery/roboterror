class CreateInventory < ActiveRecord::Migration
  def up
    create_table :inventories do |table|
      table.integer :equipment_id
      table.integer :user_id
      table.integer :robot_id
    end
  end

  def down
    drop_table :inventories
  end
end
