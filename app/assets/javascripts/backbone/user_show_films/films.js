(function(app) {
  
  app.FilmModel = Backbone.Model.extend({
      urlRoot: "/films/update_name", 
    
      defaults:  {
                   name: "",
                   introtext: "",
                   id: 0

                 },
    
  })



  app.FilmsCollection = Backbone.Collection.extend({

     url: '/films/user', 
     model: app.FilmModel 

  }) 

})(window);
  
  
   
   