class Role < ActiveRecord::Base
  attr_accessible :name
  has_many :users_roles
  has_many :users
end
