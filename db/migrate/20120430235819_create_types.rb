class CreateTypes < ActiveRecord::Migration
  def up
    create_table :equipment_types do |t|
      t.string :name, null:false
    end
  end
end
