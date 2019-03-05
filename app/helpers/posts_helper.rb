module PostsHelper
  def get_author(user)
    "#{user.first_name} #{user.last_name}"
  end

  def post_comments(post)
    post.comments
  end
end
