class ChangeEquipment < ActiveRecord::Migration
  def change
    rename_column :equipments, :type_id, :equipment_type_id
  end
end
