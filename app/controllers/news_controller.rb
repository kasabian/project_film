class NewsController < ApplicationController
  # GET /news
  # GET /news.json
 load_and_authorize_resource
  def index

    if params[:category] != nil then
      @category = CategoryNews.find(params[:category])
      @news = @category.news.order("created_at DESC").all
    else
      @news = News.order("created_at DESC").all
    end  

    


    @news = Kaminari.paginate_array(@news).page(params[:page]).per(Setting.first.count_page)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @news }
    end
  end

  # GET /news/1
  # GET /news/1.json
  def show
    fn = params[:fn]
    @news = News.find_by_frandly_name(fn)
    @news = News.find(fn) if @news == nil
    respond_to do |format|
      format.html 
      format.json { render json: @news }
    end
  end

  # GET /news/new
  # GET /news/new.json
  def new
    @news = News.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @news }
    end
  end

  # GET /news/1/edit
  def edit
    @news = News.find(params[:id])
  end

  # POST /news
  # POST /news.json
  def create
    user = current_user
    params[:news][:category_news_id] = params[:category]
   
    @news = user.news.new(params[:news])

    respond_to do |format|
      if @news.save
        format.html { redirect_to news_index_url, notice: 'News was successfully created.' }
        format.json { render json: @news, status: :created, location: @news }
      else
        format.html { render action: "new" }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /news/1
  # PUT /news/1.json
  def update
    
    params[:news][:category_news_id] = params[:category]
    @news = News.find(params[:id])

    respond_to do |format|
      if @news.update_attributes(params[:news])
        format.html { redirect_to news_index_url, notice: 'News was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def destroy
    @news = News.find(params[:id])
    @news.destroy

    respond_to do |format|
      format.html { redirect_to news_index_url }
      format.json { head :no_content }
    end
  end
end
