require 'spec_helper'

describe Equipment do
  it{ should have_many(:inventories) }
  it{ should have_many(:users).through(:inventories) }

  it{ should validate_presence_of :name }
  it{ should validate_presence_of :price }
end
