class Stat < ActiveRecord::Base
  # Associations
  has_many :equipment_stats, dependent: :destroy
  has_many :equipments, through: :equipment_stats

  # Validation
  validates :name, presence: true
  validates :price, presence: true
  validates :price_growth, presence:true

  def get_price_for(modifier)
    case
    when modifier == 0
      0
    when modifier == 1
      self.price
    when modifier > 1
      modifier * (self.price*(1 + self.price_growth)**modifier).to_i
    when modifier == -1
      0 - self.price
    when modifier < -1
      modifier * (self.price*(1 + self.price_growth)**modifier.abs).to_i
    end
  end
end
