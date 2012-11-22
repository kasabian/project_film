class Comment < ActiveRecord::Base
   validates :content, :presence => true,
                      :length => { :minimum => 5 }

   attr_accessible :content,:user_id,:film_id
  belongs_to :film
  belongs_to :user
end
