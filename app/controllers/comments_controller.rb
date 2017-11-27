class CommentsController < ApplicationController

  def create
    info = Info.find(params[:info_id])
    @comment = info.comments.create(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to info_path(info)
    else
      render :new
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end
end
