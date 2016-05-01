class User < ActiveRecord::Base
  attr_accessor :remember_token, :activation_token

  has_secure_password
  before_save :set_email_to_lowercase
  before_create :generate_activation_token

  validates :name, presence: true, length: {maximum: 50}
  validates :email, 
    presence: true, 
    format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}, 
    uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 6}, allow_nil: true

  def self.digest(unencrypted_string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(unencrypted_string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    @remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(@remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest) == remember_token
  end

private
  def set_email_to_lowercase
    self.email = self.email.downcase
  end

  def generate_activation_token
    @activation_token = User.new_token
    self.activation_digest = User.digest(@activation_token)
  end


end