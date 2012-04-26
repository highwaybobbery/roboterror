class CreateEquipmentStats < ActiveRecord::Migration
  def up
    create_table :equipment_stats do |t|
      t.integer :equipment_id, null: false
      t.integer :stat_id, null: false
      t.integer :modifier, null: false
      t.timestamps
    end
  end

  def down
    drop_table :equipment_stats
  end
end
