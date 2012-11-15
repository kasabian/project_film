class CreateFilmsJanrsJoinTable < ActiveRecord::Migration
   def change
     create_table :films_janrs, :id => false do |t|
       t.integer :film_id
       t.integer :janr_id
     end
  end
end
