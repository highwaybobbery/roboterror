class ChangeChassesNameToString < ActiveRecord::Migration
  def up
    change_column :chasses, :name, :string
   end

  def down
  end
end
