require 'spec_helper'

describe Chassis do
  it { should have_db_column(:name) }
  it { should have_many(:robots) }
end
