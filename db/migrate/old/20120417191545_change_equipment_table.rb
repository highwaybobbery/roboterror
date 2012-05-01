class ChangeEquipmentTable < ActiveRecord::Migration
  def change
    add_column :equipment, :price, :integer
  end
end
