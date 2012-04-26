require 'spec_helper'

describe Robot do
  # Database
  it { should have_db_column(:created_at) }
  it { should have_db_column(:updated_at) }

  # Attributes
  it { should allow_mass_assignment_of(:chassis_id) }
  it { should allow_mass_assignment_of(:name) }

  # Associations
  it { should belong_to(:user) }
  it { should belong_to(:chassis) }

  # Validations
  it { should validate_presence_of(:chassis) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:user) }
end
