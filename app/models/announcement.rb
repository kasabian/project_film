class Announcement < ActiveRecord::Base
  attr_accessible :content, :name, :introtext, :tag, :image, :image_cache, :frandly_name
  
  validates :frandly_name, :uniqueness => true  
  validates :frandly_name, :format => { :with => /\A[a-zA-Z,-]+\z/}
  
  mount_uploader :image, ImageUploader
end
