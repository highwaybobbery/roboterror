class CreateFight < ActiveRecord::Migration
  def change
    create_table 'fight_results' do |t|
      t.column :opponent_id, :integer, null: false
      t.column :attacker_id, :integer, null: false
      t.column :winner_id, :integer, null: false
      t.column :loser_id, :integer, null: false
      t.column :winner_hp, :integer, null: false
      t.column :elapsed_time, :integer, null: false
      t.column :timeline, :string, null: false
      t.column :winner_xp, :integer, null: false
      t.column :winner_payout, :integer, null: false
      t.column :loser_xp, :integer, null: false
      t.column :loser_payout, :integer, null: false

      t.timestamps
    end
  end
end
