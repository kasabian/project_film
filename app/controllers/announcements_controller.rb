class AnnouncementsController < ApplicationController
  # GET /announcements
  # GET /announcements.json
   load_and_authorize_resource

  def get_announce_cu
    user = User.find(params["id"]) 
    announce = user.announcements
   
    render :json => announce 
  end

  def index
    if params[:id] != nil then
        user = User.find(params["id"]) 
        @announcements = user.announcements
    else      
       @announcements = Announcement.all
       @announcements = Kaminari.paginate_array(@announcements).page(params[:page]).per(Setting.first.count_page)
    end  
  
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @announcements }
    end
  end

  # GET /announcements/1
  # GET /announcements/1.json
  def show 
    @announcement = Announcement.find_by_frandly_name(params[:fn])
    @announcement = Announcement.find(params[:fn]) if @announcement == nil
     
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @announcement }
    end
  end

  # GET /announcements/new
  # GET /announcements/new.json
  def new
    @announcement = Announcement.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @announcement }
    end
  end

  # GET /announcements/1/edit
  def edit
    @announcement = Announcement.find(params[:id])
  end

  # POST /announcements
  # POST /announcements.json
  def create
    user = current_user
    @announcement = user.announcements.new(params[:announcement])
    respond_to do |format|
      if @announcement.save
        format.html { redirect_to announcements_url, notice: 'Announcement was successfully created.' }
        format.json { render json: @announcement, status: :created, location: @announcement }
      else
        format.html { render action: "new" }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /announcements/1
  # PUT /announcements/1.json
  def update
    @announcement = Announcement.find(params[:id])

    respond_to do |format|
      if @announcement.update_attributes(params[:announcement])
        format.html { redirect_to announcements_path, notice: 'Announcement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /announcements/1
  # DELETE /announcements/1.json
  def destroy
    @announcement = Announcement.find(params[:id])
    @announcement.destroy

    respond_to do |format|
      format.html { redirect_to announcements_url }
      format.json { head :no_content }
    end
  end
end
