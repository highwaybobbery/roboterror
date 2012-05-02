class Equipment < ActiveRecord::Base
  # Attributes
  attr_accessible :name, :equipment_type_id, :chassis_id

  # Associations
  has_many :inventories, dependent: :destroy
  has_many :users, through: :inventories
  has_many :equipment_stats, dependent: :destroy
  belongs_to :chassis
  belongs_to :equipment_type

  # Validations
  validates_presence_of :name
  validates_presence_of :chassis
  validates_presence_of :equipment_type

  def calculate_price
    reload
    self.price = equipment_stats.collect(&:price).sum
    self.save
  end

  def calculate_stats
    stats = {}
    equipment_stats.each do |equipment_stat|
      stats[equipment_stat.stat.name.to_sym] = equipment_stat.modifier
    end
    stats
  end
end
