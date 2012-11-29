class Film < ActiveRecord::Base
  attr_accessible :film, :introtext, :name, :role, :year, :image, :image_cache,:janr, :film_type, :directed_by, 
                  :length, :country, :tag, :frendlyname
  
  validates :frendlyname, :uniqueness => true
  
   ajaxful_rateable :stars => 5
  validates :frendlyname, :presence => true,
                       :length => { :minimum => 1}
  validates :frendlyname, :format => { :with => /\A[a-zA-Z]+\z/}
  
  attr_accessor :janr, :film_type
  
  belongs_to :type
  has_and_belongs_to_many :janrs
  has_many :comments
  
   def check_janr params
     janrs = Janr.all
     self.janrs.clear
     janrs.each do |janr|
      self.janrs << janr if params[janr.id.to_s] != nil
     end  
   end  
     
  def self.search(search)
    find(:all, :conditions => ['name LIKE ? ', "%#{search}%"])
  end
 
  mount_uploader :image, ImageUploader
  
end
