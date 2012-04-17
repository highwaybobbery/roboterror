class User < ActiveRecord::Base
  include Clearance::User
  attr_accessible :admin, :balance

  validates :balance, :numericality => { :only_integer => true,
                                          :greater_than_or_equal_to => 0 }
  has_many :robots
  has_many :inventories
  has_many :equipment, :through => :inventories
end
