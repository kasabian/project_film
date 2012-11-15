#ecoding: utf-8
class SearchController < ApplicationController
  def index
    @films = Film.search(params[:search])
    @count = @films.count
    @search = params[:search]
    @films = Kaminari.paginate_array(@films).page(params[:page]).per(16)
    
    flash.now[:notice] = 'Поиск не дал результатов.' if @count == 0
    respond_to do |format|
      format.html # search.html.erb
      format.json { render json: @questions }
    end
  end
end
