class Inventory < ActiveRecord:: Base
  # Attributes
  attr_accessible :equipment_id

  # Validations
  validates :equipment, presence: true
  validates :user, presence: true

  # Associations
  belongs_to :user
  belongs_to :equipment
  belongs_to :robot

  def self.unassigned
    where(:robot_id => nil)
  end
end
