class Article < ActiveRecord::Base
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings
  
  validates :title, presence: true
  validates :body, presence: true

  def tag_list
    tags.collect(&:name).join(', ')
  end

  def tag_list=(val)
    parse_tags = val.split(/,/).map { |tag| tag.strip.downcase }.uniq
    tags.destroy_all if parse_tags.size > 0
    parse_tags.each do |tag|
      tag_obj = Tag.find_or_create_by(name: tag)
      tags << tag_obj
    end
  end

  


end
