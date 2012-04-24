require 'spec_helper'

describe Inventory do
  # Database
  it { should have_db_column(:created_at) }
  it { should have_db_column(:updated_at) }

  # Validations
  it{ should validate_presence_of(:user) }
  it{ should validate_presence_of(:equipment) }

  # Associations
  it{ should belong_to :user }
  it{ should belong_to :equipment }
  it{ should belong_to :robot }
end
