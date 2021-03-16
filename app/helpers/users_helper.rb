module UsersHelper
  def user_avatar(user, class_name = 'img-profile-nav')
    if user.avatar.attached?
      image_tag(user.avatar, class: class_name)
    else
      gravatar_id = Digest::MD5.hexdigest(user.email)
      gravatar_url = "https://www.gravatar.com/avatar/#{gravatar_id}?d=identicon"
      image_tag(gravatar_url, alt: user.email, class: class_name)
    end
  end
end
