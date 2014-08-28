class CommentsController < ApplicationController
  
  def create
    @comment = current_user.comments.new(comment_params)
    
    if @comment.save
      redirect_to song_url(params[:comment][:song_id])
    else
      flash[:errors] = @comment.errors.full_messages
      render redirect_to song_url(params[:comment][:song_id])
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:song_id, :body)
  end
  
end