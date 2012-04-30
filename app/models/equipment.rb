class Equipment < ActiveRecord::Base
  # Attributes
  attr_accessible :name

  # Associations
  has_many :inventories, dependent: :destroy
  has_many :users, through: :inventories
  has_many :equipment_stats, dependent: :destroy

  # Validations
  validates_presence_of :name

  def calculate_price
    reload
    self.price = equipment_stats.collect(&:price).sum
    self.save
  end
end
