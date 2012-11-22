class KinofilmsController < ApplicationController
   def index
     type = Type.find_by_name("films")
     if params[:janr] != nil 
	              @films = Janr.find_by_id(params[:janr].to_s).films.order("created_at DESC").uniq
		   else   @films = Film.where(:type_id=>type.id).order("created_at DESC")
		   end  
    @films = Kaminari.paginate_array(@films).page(params[:page]).per(16)  
      respond_to do |format|
        format.html 
        format.json { render json: @films }
      end
    end
end