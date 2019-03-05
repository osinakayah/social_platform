class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @comment = Comment.new
    @posts = current_user.posts.paginate(:page => params[:page]).order('created_at DESC')
  end

  def create

    @post = Post.new({content: post_params[:content], user_id: current_user.id})

    if @post.save
      redirect_to posts_path, :alert => "Post made successfully"
    else
      flash.now[:notice] = "An error occured"
      render 'users/index'
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

end
