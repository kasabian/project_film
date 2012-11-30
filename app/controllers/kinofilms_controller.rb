class KinofilmsController < ApplicationController
   def index
     type = Type.find_by_name("films")
     if params[:janr] != nil 
                      @janr = Janr.find_by_id(params[:janr].to_s)
	              @films = @janr.films.order("f_rate DESC").uniq
		   else   @films = Film.where(:type_id=>type.id).order("f_rate DESC")
		   end  
      @films = Kaminari.paginate_array(@films).page(params[:page]).per(Setting.first.count_page)  
      respond_to do |format|
        format.html 
        format.json { render json: @films }
      end
    end
end