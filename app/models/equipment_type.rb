class EquipmentType < ActiveRecord::Base
  # Associations
  has_many :equipments
end
