class AdminController < ApplicationController  
  def index
    redirect_to films_url unless User.admin? current_user
  end
end
