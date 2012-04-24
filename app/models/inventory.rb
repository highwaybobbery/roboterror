class Inventory < ActiveRecord:: Base
  # Validations
  validates :equipment, presence: true
  validates :user, presence: true

  # Associations
  belongs_to :user
  belongs_to :equipment
  belongs_to :robot
end
