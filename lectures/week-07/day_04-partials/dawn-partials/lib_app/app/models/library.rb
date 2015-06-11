class Library < ActiveRecord::Base
  has_many :library_users
  has_many :users, through: :library_users
end
