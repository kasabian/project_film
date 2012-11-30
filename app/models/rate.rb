class Rate < ActiveRecord::Base
  after_save :film_rate
  after_update :film_rate
  belongs_to :rater, :class_name => "User"
  belongs_to :rateable, :polymorphic => true  
  validates_numericality_of :stars, :minimum => 1
  attr_accessible :rate, :dimension
  
  def film_rate 
    films_r = Rate.where(:rateable_id => self.rateable_id) 
    r = 0.0
    films_r.each { |film_r| r += film_r.stars }	
    r = r / films_r.count
    film = Film.find_by_id(self.rateable_id)  
    film.f_rate = r
    film.save
  end  
  
end
