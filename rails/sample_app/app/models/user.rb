class User < ActiveRecord::Base
  before_save :set_email_to_lowercase

  validates :name, presence: true, length: {maximum: 50}
  validates :email, 
    presence: true, 
    format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}, 
    uniqueness: {case_sensitive: false}

private
  def set_email_to_lowercase
    self.email = self.email.downcase
  end

end
