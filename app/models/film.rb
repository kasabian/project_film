class Film < ActiveRecord::Base
  attr_accessible :film, :introtext, :name, :role, :year, :image, :image_cache,:janr, :film_type, :directed_by, :f_rate,
                  :length, :country, :tag, :frendlyname, :user_id
  
  validates :frendlyname, :uniqueness => true
  belongs_to :user
  
  ajaxful_rateable :stars => 5
  validates :frendlyname, :image, :presence => true,
                       :length => { :minimum => 1}
  validates :frendlyname, :format => { :with => /\A[a-zA-Z,-]+\z/}
  attr_accessor :janr, :film_type
  
  belongs_to :type
  has_and_belongs_to_many :janrs
  has_many :comments

  
  after_create :set_image
  
   def check_janr params
     janrs = Janr.all
     self.janrs.clear
     janrs.each do |janr|
      self.janrs << janr if params[janr.id.to_s] != nil
     end  
   end  

  def self.get_hash(films)
    films_hash = []

    films.each do |film|
      films_hash.push  name:film.name, introtext:film.introtext, id: film.id
    end 
     
    films_hash
    
  end 
     
  def self.search(search)
    find(:all, :conditions => ['name LIKE ? ', "%#{search}%"])
  end
  
  def set_image
    self.image = "no image" unless  self.image?
    self.save
  end  
 
  mount_uploader :image, ImageUploader
  
end
