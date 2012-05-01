class AddChassisAndTypeToEquipments < ActiveRecord::Migration
  def change
    add_column :equipments, :chassis_id, :integer, null: false
    add_column :equipments, :type_id, :integer, null: false

    add_index :equipments, [:chassis_id, :type_id]
  end
end
