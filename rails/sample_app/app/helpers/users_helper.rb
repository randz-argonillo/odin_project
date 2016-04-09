module UsersHelper
  
  def gravatar_for(user)
    id = Digest::MD5.hexdigest(user.email.downcase)
    url = "https://secure.gravatar.com/avatar/#{id}"
    image_tag url, alt: "user photo", class: "gravatar"
  end

end
