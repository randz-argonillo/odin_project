class Comment < ActiveRecord::Base
  validates :author_name, presence: true
  validates :body, presence: true
  belongs_to :article
end
