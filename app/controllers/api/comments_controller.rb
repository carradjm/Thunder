class Api::CommentsController < ApplicationController
  
  def create
    @comment = current_user.comments.build(comment_params)
  
    if @comment.save
      render partial: "api/comments/show.json", locals: { comment: @comment }
    else
      render json: @comment.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    
    @comment.destroy
    render partial: "api/comments/show.json", locals: { comment: @comment }
  end
  
  private
  def comment_params
    params.require(:comment).permit(:song_id, :body)
  end
  
end