class Article < ActiveRecord::Base
  has_attached_file :image
  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png"]

  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings
  belongs_to :author

  def tag_list
    tags.join(", ") 
  end

  def tag_list=(val)
    tag_names = val.split(",").collect{ |tag| tag.strip.downcase }.uniq
    tag_objs = tag_names.collect{ |tag| Tag.find_or_create_by(name: tag) }
    self.tags = tag_objs
  end
end
