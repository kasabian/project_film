class CartoonsController < ApplicationController
  def index
      type = Type.find_by_name("cartoons") 
      @films = Film.where(:type_id=>type.id).order("created_at DESC")
      @films = Kaminari.paginate_array(@films).page(params[:page]).per(16)
      respond_to do |format|
        format.html 
        format.json { render json: @films }
      end
  end
end
