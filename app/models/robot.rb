class Robot < ActiveRecord::Base
  # Attributes
  attr_accessible :name

  # Associations
  belongs_to :user
  has_many :inventories
  has_many :equipments, through: :inventories

  # Validations
  validates :name, presence: true
  validates :user, presence: true

  def equipped_with?(equipment_type)
    equipments.exists? equipment_type_id: equipment_type.id
  end

  def calculate_price
    equipments.sum(:price)
  end

  def calculate_stats
    stats = {}
    equipments.each do |equipment|
      equipment_stats = equipment.calculate_stats
      stats.merge!(equipment_stats) {|key,src,addend| src + addend}
    end
    stats
  end
end
