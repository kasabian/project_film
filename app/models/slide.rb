class Slide < ActiveRecord::Base
  attr_accessible :image, :is_show, :image_cache
  
  mount_uploader :image, ImageUploader
end
