class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    if comment.save
      flash[:alert] = "Comment made successfully"
    else
      flash[:notice] = "An error occured"
    end
    redirect_back fallback_location: request.original_url

  end

  def comment_params
    params.require(:comment).permit(:comment, :post_id)
  end
end
