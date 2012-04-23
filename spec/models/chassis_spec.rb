require 'spec_helper'

describe Chassis do
  # Database
  it { should have_db_column(:created_at) }
  it { should have_db_column(:updated_at) }

  # Associations
  it { should have_many(:robots) }
end
