class Ad < ActiveRecord::Base
  attr_accessible :image, :image_cache, :name, :title, :url, :status
  
  mount_uploader :image, ImageUploader
  
  
end
