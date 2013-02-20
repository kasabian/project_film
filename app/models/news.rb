class News < ActiveRecord::Base
  attr_accessible :content, :name, :introtext, :tag, :image, :image_cache
  
  mount_uploader :image, ImageUploader
end
