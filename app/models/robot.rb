class Robot < ActiveRecord::Base
  # Attributes
  attr_accessible :chassis_id, :name

  # Associations
  belongs_to :chassis
  belongs_to :user

  # Validations
  validates :chassis, presence: true
  validates :name, presence: true
  validates :user, presence: true
end
