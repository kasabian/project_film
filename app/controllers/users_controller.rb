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
