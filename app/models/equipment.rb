class Equipment < ActiveRecord::Base
  has_many :inventories
  has_many :users, :through => :inventories

  validates_presence_of :name, :price
end
