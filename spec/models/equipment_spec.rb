require 'spec_helper'

describe Equipment do
  # Database
  it { should have_db_column(:created_at) }
  it { should have_db_column(:updated_at) }

  # Associations
  it{ should have_many(:inventories) }
  it{ should have_many(:users).through(:inventories) }

  # Validations
  it{ should validate_presence_of(:name) }
  it{ should validate_presence_of(:price) }
end
