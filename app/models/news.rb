class News < ActiveRecord::Base
  attr_accessible :content, :name, :introtext, :tag, :image, :image_cache, :frandly_name, :user_id
   
  validates :frandly_name, :uniqueness => true  
  validates :frandly_name, :format => { :with => /\A[a-zA-Z,-]+\z/}
  belongs_to :user
   
  mount_uploader :image, ImageUploader
end
