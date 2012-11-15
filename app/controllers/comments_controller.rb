class CommentsController < ApplicationController
  def create 
    @film = Film.find(params[:film_id])
    @comment = @film.comments.create(params[:comment])
    redirect_to film_path(@film)
  end
  
  
  def destroy
    @film = Film.find(params[:film_id])
    @comment = @film.comments.find(params[:id])
    @comment.destroy
    redirect_to film_path(@film)
  end
end
