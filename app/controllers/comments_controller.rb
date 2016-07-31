class CommentsController < ApplicationController

  def create
    info = Info.find(params[:info_id])
    @comment = info.comments.create(comment_params)
    redirect_to info_path(info)
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :body)
  end
end
