class User < ActiveRecord::Base
  has_secure_password
  before_save :set_email_to_lowercase

  validates :name, presence: true, length: {maximum: 50}
  validates :email, 
    presence: true, 
    format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}, 
    uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 6}

private
  def set_email_to_lowercase
    self.email = self.email.downcase
  end

end
