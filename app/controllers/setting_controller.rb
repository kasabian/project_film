# encoding: utf-8
class SettingController < ApplicationController
    layout "admin" 
    load_and_authorize_resource
    def index
     @setting = Setting.first  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @setting }
      end
   end
   
    def update
     @setting = Setting.find(params[:id])     
      respond_to do |format|
	if @setting.update_attributes(params[:setting])
         format.html { redirect_to setting_index_path, notice: 'сохранено успешно' }
	else
	  format.html { redirect_to setting_index_path, notice: 'ошибка при сохранении' }
	end  
      end
    end
 
end
