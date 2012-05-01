class SetDefaultForEquipmentPrice < ActiveRecord::Migration
  def up
    change_column :equipments, :price, :integer, default: 0
  end

  def down
  end
end
