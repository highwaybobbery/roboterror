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

  def self.with_equipment_type(equipment_type)
    sql = ActiveRecord::Base.connection();
    equipment_ids = sql.select_values("SELECT id FROM equipments WHERE equipment_type_id = '#{equipment_type.id}';")
    where(:equipment_id => equipment_ids)
  end
end
