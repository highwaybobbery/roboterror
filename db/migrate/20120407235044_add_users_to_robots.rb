class AddUsersToRobots < ActiveRecord::Migration
  def change
    add_column :robots, :user_id, :integer
    add_index :robots, :user_id
  end
end
