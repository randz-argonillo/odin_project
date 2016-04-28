class Post < ActiveRecord::Base
  validates :message, presence: true
  validates :message, length: {minimum: 30}

  belongs_to :user
end
