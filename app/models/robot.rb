class Robot < ActiveRecord::Base
  belongs_to :user
  belongs_to :chassis

  %w{user chassis name}.map{|field|
    validates_presence_of field
  }
end
