class ProfilController < ApplicationController
  def index
    @user = User.find(current_user)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end 
  end

  def edit
    @user = User.find(current_user)
  end

  def update
      @user = User.find(current_user)
      respond_to do |format|
        if @user.update_attributes(params[:user])
          format.html { redirect_to profil_index_path, notice: 'User was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { redirect_to profil_edit_path }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
       end
     
  end

end
