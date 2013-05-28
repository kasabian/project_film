module ApplicationHelper
  
   def top_films
     Film.order("f_rate DESC").limit(10)
   end  
   def site_name
     Setting.first.site_name 
   end
   
    def comment_vk
     Setting.first.commentvk 
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


   def is_today date_str
    t = Time.new
    date = date_str.split[0] 
    today_date = "#{t.year}.#{add_null t.month}.#{add_null t.day}"
    return true if today_date == date
    return false;
   end 

   def is_yesterday date_str
    t = Time.new
    date = date_str.split[0] 
    today_date = "#{t.year}.#{add_null t.month}.#{add_null t.day-1}"
    return true if today_date == date
    return false;
   end 

   def is_otherday date_str
    t = Time.new
    date = date_str.split[0] 
    today_date = "#{t.year}.#{add_null t.month}.#{add_null t.day-1}"
    return true if today_date > date
    return false;
   end 
  
   def add_null param
     return "0"+param.to_s if param.to_i < 10
     return param
   end 


   def get_arr_for_cotegoryNews
     m = [];
     CategoryNews.all.each do |c|  
       m.push [c.name, c.id]                                             
     end
     m
   end

   def get_category_news_id object
 
      if object.category_news_id != nil then
        return  object.category_news.id
      else    
        return  1 
      end
      
   end

  
end
