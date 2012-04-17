class CreateChasses < ActiveRecord::Migration
  def change
    create_table :chasses do |t|
t.column :name, :integer
      t.timestamps
    end
  end
end
