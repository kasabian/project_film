class AdminController < ApplicationController  
   load_and_authorize_resource
  def index
    redirect_to films_url unless User.admin? current_user
  end
end
