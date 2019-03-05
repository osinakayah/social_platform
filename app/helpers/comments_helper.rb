module CommentsHelper
  def poster_avatar(email)
    hash = Digest::MD5.hexdigest(email)
    image_src = "https://www.gravatar.com/avatar/#{hash}"
    image_tag image_src, class: "img-fluid img-circle rounded-circle"
  end
end
