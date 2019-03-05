module UsersHelper
  def is_friend?(id)
    UserFriend.where("(user_id = :user_id AND friend_id = :friend_id) OR (user_id = :friend_id AND friend_id = :user_id)", user_id:  current_user.id, friend_id: id).count > 0
  end
end
