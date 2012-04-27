class EquipmentStat < ActiveRecord::Base
  # Assignment
  attr_accessible :stat_id, :equipment_id, :modifier

  # Associations
  belongs_to :stat
  belongs_to :equipment

  # Validations
  validates :stat_id, presence: true
  validates :equipment_id, presence: true
  validates :modifier, presence: true

  # Callbacks
  after_save :update_equipment_price

  def price
    self.stat.get_price_for(self.modifier)
  end

  private

  def update_equipment_price
    self.equipment.calculate_price
  end
end
