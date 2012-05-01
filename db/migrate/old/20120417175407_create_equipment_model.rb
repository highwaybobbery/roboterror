class CreateEquipmentModel < ActiveRecord::Migration
  def change
    create_table :equipment do |table|
      table.string :name
    end
  end
end
