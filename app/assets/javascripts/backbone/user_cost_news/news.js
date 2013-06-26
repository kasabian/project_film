(function(app) {
  
  app.NewsModel = Backbone.Model.extend({
      urlRoot: "/news", 
    
      defaults:  {
                   name: "",
                   content: "",
                   id: 0,
                   char_count: 0,
                   order: false,
                   cost: 0
                 },
    
  })



  app.NewsCollection = Backbone.Collection.extend({

     url: '/news', 
     model: app.NewsModel 

  }) 

})(window);
  
  
   
   