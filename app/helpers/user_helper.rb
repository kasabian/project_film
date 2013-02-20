module UserHelper
   def admin_id
     Role.find_by_name("admin").id.to_i
   end
   def user_id
     Role.find_by_name("user").id.to_i 
   end 
   
   def moderator_id
     Role.find_by_name("moderator").id.to_i 
   end
   
   def other_id
     Role.find_by_name("other").id.to_i 
   end 
   
end
