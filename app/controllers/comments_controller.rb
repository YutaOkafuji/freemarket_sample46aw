class CommentsController < ApplicationController
  # def new
  #   @comment = Comment.new
  # end

  def create
    # binding.pry
    @comment = Comment.create(content: comment_params[:content], item_id: comment_params[:item_id], user_id: current_user.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :item_id)
  end
end
