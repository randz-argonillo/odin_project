module UsersHelper
  
  def gravatar_for(user, options = {size: 80})
    id = Digest::MD5.hexdigest(user.email.downcase)
    url = "https://secure.gravatar.com/avatar/#{id}?s=#{options[:size]}"
    image_tag url, alt: "user photo", class: "gravatar"
  end

  def submit_caption(user, new_caption, edit_caption)
    if user.new_record? then new_caption else edit_caption end
  end
end
