class CreateStats < ActiveRecord::Migration
  def up
    create_table :stats do |t|
      t.string :name, null: false
      t.integer :price, default: 1, null: false
      t.decimal :price_growth, default: 1, null: false

      t.timestamps
    end
  end

  def down
    drop_table :stats
  end
end
