class FilmsController < ApplicationController
 load_and_authorize_resource
 helper :all
  # GET /films
  # GET /films.json
  def index
    @films = Film.order("created_at DESC")
    @films = Kaminari.paginate_array(@films).page(params[:page]).per(16)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @films }
    end
  end

  # GET /films/1
  # GET /films/1.json
  def show 
    @film = Film.find_by_frendlyname(params[:frendlyname])
    @film = Film.find(params[:frendlyname]) if @film == nil
    @rate  = @film.rates
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @film }
    end
  end

  # GET /films/new
  # GET /films/new.json
  def new
    @film = Film.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @film }
    end
  end

  # GET /films/1/edit
  def edit
    @film = Film.find(params[:id])
  end

  # POST /films
  # POST /films.json
  def create
    @film = Film.new(params[:film])
    @type = Type.find_by_name(params[:film][:film_type].to_s)
    @film.check_janr params
    @film.type_id = @type.id 
    respond_to do |format|
      if @film.save
        format.html { redirect_to @film, notice: 'Film was successfully created.' }
        format.json { render json: @film, status: :created, location: @film }
      else
        format.html { render action: "new" }
        format.json { render json: @film.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /films/1
  # PUT /films/1.json
  def update
    @type = Type.find_by_name(params[:film][:film_type].to_s) 
    @film = Film.find(params[:id])
    @film.type_id = @type.id 
    @film.check_janr params
    respond_to do |format|
      if @film.update_attributes(params[:film])
        format.html { redirect_to @film, notice: 'Film was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @film.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /films/1
  # DELETE /films/1.json
  def destroy
    @film = Film.find(params[:id])
    @film.destroy

    respond_to do |format|
      format.html { redirect_to films_url }
      format.json { head :no_content }
    end
  end
  
  
   def rate
    @film = Film.find_by_frendlyname(params[:id])
    @film = Film.find(params[:id]) if @film == nil
    @film.rate(params[:stars], current_user, params[:dimension])
     respond_to do |format|
       if @film.rate(params[:stars], current_user, params[:dimension])
         format.js { render :partial => "rating" }
       else
         format.js { render :partial => "rating" }
      end
    end
   end 
  
end
