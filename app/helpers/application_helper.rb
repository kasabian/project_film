module ApplicationHelper
  
   def site_name
     Setting.first.site_name 
   end  
   
   def kay_words
     Setting.first.tegs 
   end
   

  
end
