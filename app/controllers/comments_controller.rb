class CommentsController < ApplicationController
  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = @prototype.comments.new(comment_params.merge(user_id: current_user.id))
  
    if @comment.save
      redirect_to prototype_path(@prototype), notice: "コメントが投稿されました。"
    else
      flash[:alert] = "コメントの投稿に失敗しました。コメントを入力してください。"
      @comments = @prototype.comments
      render "prototypes/show"
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content)
  end
end
