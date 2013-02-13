module ApplicationHelper
  
   def top_films
     Film.order("f_rate DESC").limit(10)
   end  
   def site_name
     Setting.first.site_name 
   end  
   
   def kay_words
     Setting.first.tegs 
   end
   
   def vidjet_vk
     Setting.first.vidjet  
   end
   
   def counter
     Setting.first.counter 
   end
   
   def slides
     Slide.all 
   end
   def socbutton
      Setting.first.socbutton
   end  
   def admin?
     status = false
     role = Role.find_by_id(current_user.role_id).name if current_user != nil
     status = true if role == "admin"
     status      
   end
   
   def cut_str str, count 
     if str.length > count then str[0..count.to_i]+".."
     else str
     end
   end
  
end
