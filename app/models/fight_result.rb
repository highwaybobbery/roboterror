class FightResult < ActiveRecord::Base
  # Associations
  belongs_to :opponent, class_name: 'Robot'
  belongs_to :attacker, class_name: 'Robot'
  belongs_to :winner, class_name: 'Robot'
  belongs_to :loser, class_name: 'Robot'

  # Database
  serialize :timeline

  # Validations
  validates_presence_of :opponent_id, :attacker_id, :winner_id, :winner_hp, :elapsed_time,
    :timeline, :winner_xp, :winner_payout, :loser_xp, :loser_payout
end
