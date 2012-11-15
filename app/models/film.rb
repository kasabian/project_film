class Film < ActiveRecord::Base
  attr_accessible :film, :introtext, :name, :role, :year, :image, :image_cache,:janr, :film_type, :directed_by, :length, :country
  attr_accessor :janr, :film_type
  
  belongs_to :type
  has_and_belongs_to_many :janrs
  has_many :comments
  
   def create_janr janr_words
    arr_2 =[]
    arr = janr_words.split(", ")
    arr.count.times {|i| arr[i] = arr[i].strip}
    arr.count.times do |i|
      a = /,/.match arr[i].to_s
      if a != nil then
   arr_2=arr[i].to_s.split(',')
   arr.delete_at(i)
      end
    end
    for i in 0..arr.count
      for j in 0..arr_2.count
          arr_2.delete_at(j) if arr[i].to_s == arr_2[j].to_s
       end	
     end
    arr_2.count.times {|i| arr << arr_2[i]}
    for i in 0..arr.count-1
      for j in i+1..arr.count
          arr.delete_at(j) if arr[i].to_s == arr[j].to_s
       end	
     end
     self.janrs.clear
     self.janrs << arr.map {|el| Janr.find_or_initialize_by_name(el.to_s)}
  end 
  
  def self.search(search)
    find(:all, :conditions => ['name LIKE ? ', "%#{search}%"])
  end
 
  mount_uploader :image, ImageUploader
  
end
