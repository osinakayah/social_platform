class UserFriendsController < ApplicationController
  def create
    user_friend = UserFriend.new

    user_friend.user_id = current_user.id
    user_friend.friend_id = params[:friend_id]

    friend_name = params[:friend_name]

    if user_friend.save
      flash[:alert] = "#{friend_name} is now your friend"
      redirect_to users_index_path
    else
      flash.now[:notice] = "An error occured"
      render 'users/index'
    end

  end
end
