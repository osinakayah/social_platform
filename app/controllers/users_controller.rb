class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @post = Post.new
    # @users = current_user.user_friends
    @users = User.where("id != #{current_user.id}").paginate(:page => params[:page])
  end
end
