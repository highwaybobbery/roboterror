require 'spec_helper'

describe Robot do
  it { should belong_to(:user) }
  it { should belong_to(:chassis) }
  %w{ user chassis name }.map{ |field|
    it{ should validate_presence_of(field) }
  }
end
