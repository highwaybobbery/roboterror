class Robot < ActiveRecord::Base
  # Attributes
  attr_accessible :chassis_id, :name

  # Associations
  belongs_to :chassis
  belongs_to :user
  has_many :inventories
  has_many :equipments, through: :inventories

  # Validations
  validates :chassis, presence: true
  validates :name, presence: true
  validates :user, presence: true

  def has_type_equipped?(equipment_type_id)
    equipments.where(:equipment_type_id == equipment_type_id).count > 0
  end

  def equipment_of_type(equipment_type_id)
    equipments.where(:equipment_type_id == equipment_type_id)
  end

  def calculate_price
    equipments.sum(:price)
  end

  def calculate_stats
    stats = {}
    equipments.each do |equipment|
      equipment_stats = equipment.calculate_stats
      stats.merge!(equipment_stats) {|key,src,addend|
        src + addend}
    end
    stats
  end
end
