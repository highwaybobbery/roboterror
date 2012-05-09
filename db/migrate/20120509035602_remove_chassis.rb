class RemoveChassis < ActiveRecord::Migration
  def up
    drop_table :chasses
    remove_column :equipments, :chassis_id
    remove_column :robots, :chassis_id
  end

  def down
  end
end
