class AddChassisToRobot < ActiveRecord::Migration
  def change
    add_column :robots, :chassis_id, :integer
    add_index  :robots, :chassis_id
  end
end
