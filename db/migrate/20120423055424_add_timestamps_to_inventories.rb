class AddTimestampsToInventories < ActiveRecord::Migration
  def change
    add_timestamps :inventories
  end
end
