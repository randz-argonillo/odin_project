class Micropost < ActiveRecord::Base
  belongs_to :user

  validates :user_id, :content, presence: true
  validates :content, length: {maximum: 140}
  # validate :size_within_5mb
  default_scope -> { order(created_at: :desc) }

  mount_uploader :picture, PictureUploader

private
  def size_within_5mb
    if picture.size > 5.megabytes
      errors.add(:picture, "should be within 5MB.")
    end
  end

end
