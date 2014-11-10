class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to :back
    else
      flash[:error] = "Something went wrong...."
      render 'rants/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :commenter_id, :commentable_id)
  end
end