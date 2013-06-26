(function(app) {
  
  app.UserFormModel = Backbone.Model.extend({
      urlRoot: "/user/harakter", 
    
      defaults:  {
                   harakter: "",
                   username: "",
                   id: window.this_page_user_id
                 },
    
  })


})(window);
  
  
   
   