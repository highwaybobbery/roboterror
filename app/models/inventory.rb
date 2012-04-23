class Inventory < ActiveRecord:: Base
  # Validations
  validates :equipment, presence: true
  validates :user, presence: true
end
