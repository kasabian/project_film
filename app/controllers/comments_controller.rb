class CommentsController < ApplicationController
 load_and_authorize_resource
  def create 
    @film = Film.find(params[:film_id])
    @comment = @film.comments.create(params[:comment])
    @comment.user_id = current_user.id 
    @comment.save
    redirect_to film_path(@film)
  end
  
  
  def destroy
    @film = Film.find(params[:film_id])
    @comment = @film.comments.find(params[:id])
    @comment.destroy
    redirect_to film_path(@film)
  end
end
