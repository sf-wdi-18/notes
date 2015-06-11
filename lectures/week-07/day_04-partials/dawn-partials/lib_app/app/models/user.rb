class User < ActiveRecord::Base
  has_many :library_users
  has_many :libraries, through: :library_users


  has_secure_password

  def self.confirm(params)
    user = User.find_by_email(params[:email])
    user.try(:authenticate, params[:password])
  end
end
