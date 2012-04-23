class Robot < ActiveRecord::Base
  # Associations
  belongs_to :chassis
  belongs_to :user

  # Validations
  validates :chassis, presence: true
  validates :name, presence: true
  validates :user, presence: true
end
