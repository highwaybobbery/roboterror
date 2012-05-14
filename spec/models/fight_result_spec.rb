require 'spec_helper'

describe FightResult do
  # Database
  it{ should have_db_column(:created_at) }
  it{ should have_db_column(:updated_at) }

  # Associations
  it{ should belong_to(:opponent).class_name('Robot') }
  it{ should belong_to(:attacker).class_name('Robot') }
  it{ should belong_to(:winner).class_name('Robot') }
  it{ should belong_to(:loser).class_name('Robot') }

  # Validations
  it{ should validate_presence_of(:opponent_id) }
  it{ should validate_presence_of(:attacker_id) }

  it{ should validate_presence_of(:winner_id) }
  it{ should validate_presence_of(:winner_hp) }
  it{ should validate_presence_of(:elapsed_time) }
  it{ should validate_presence_of(:timeline) }
  it{ should validate_presence_of(:winner_xp) }
  it{ should validate_presence_of(:winner_payout) }
  it{ should validate_presence_of(:loser_xp) }
  it{ should validate_presence_of(:loser_payout) }

end
