(function(app) {
  
  app.FilmModel = Backbone.Model.extend({
      urlRoot: "/films/update_order", 
    
      defaults:  {
                   name: "",
                   introtext: "",
                   id: 0,
                   char_count: 0,
                   order: false,
                   cost: 0
                 },
    
  })



  app.FilmsCollection = Backbone.Collection.extend({

     url: '/films', 
     model: app.FilmModel

  }) 

})(window);
  
  
   
   