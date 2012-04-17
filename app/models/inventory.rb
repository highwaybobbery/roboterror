class Inventory < ActiveRecord:: Base
  validates_presence_of :user, :equipment
end
