require 'spec_helper'

describe Inventory do
  it{ should validate_presence_of :user }
  it{ should validate_presence_of :equipment }
end
