require 'spec_helper'

describe User do
  # Associations
  it { should have_many(:equipment).through(:inventories) }
  it { should have_many(:inventories) }
  it { should have_many(:robots) }

  # Validations
  it { should allow_value(nil).for(:balance) }
  it { should allow_value(1).for(:balance) }
  it { should allow_value(0).for(:balance) }
  it { should_not allow_value(-1).for(:balance) }
end
