class User < ActiveRecord::Base
  # Constants
  include Clearance::User

  # Attributes
  attr_accessible :admin, :balance

  # Associations
  has_many :equipment, through: :inventories
  has_many :inventories
  has_many :robots

  # Validations
  validates :balance, numericality:
    { only_integer: true, greater_than_or_equal_to: 0, allow_nil: true }
end
