module ApplicationHelper
  
   def site_name
     Setting.first.site_name 
   end  
   
   def kay_words
     Setting.first.tegs 
   end
   
   def slides
     Slide.all 
   end
   
   def admin?
     status = false
     role = Role.find_by_id(current_user.role_id).name if current_user != nil
     status = true if role == "admin"
     status      
   end
  
end
