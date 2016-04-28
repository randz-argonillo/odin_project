class User < ActiveRecord::Base
  validates :name, :email, presence: true
  validates :password, length: {minimum: 6}, allow_nil: true

  has_secure_password
end
