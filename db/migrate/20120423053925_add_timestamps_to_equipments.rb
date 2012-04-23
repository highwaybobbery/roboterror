class AddTimestampsToEquipments < ActiveRecord::Migration
  def change
    rename_table :equipment, :equipments
    add_timestamps :equipments
  end
end
