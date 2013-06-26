#ecoding: utf-8
class UsersController < ApplicationController
 layout "admin" 
 
 load_and_authorize_resource
  def index
    @users = User.all     
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
    
  end

  def show
    @user = User.find_by_id(params["id"]) 
  end  

  def get_harakter
    user = User.find(params["id"]);
    user_hash = {:username => user.username,:id => user.id,:harakter => user.harakter}

    render :json => user_hash 
  end  

  def set_harakter
    user = User.find(params["id"]);

    user.harakter = params["user"]["harakter"]

    user.save
    
    head :no_content 

  end  
  
  def update
    @users = User.all
    user = User.find_by_id(params["id"])
    
    if params["delete"] == "delete" then 
       user.destroy
    else
       user.role_id = params["role_id"]
       user.save
    end   
    redirect_to users_path, notice: 'Изменения приняты.' 
  end

end
