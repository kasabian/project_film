(function(app) {
  
  app.AnnounceModel = Backbone.Model.extend({
      urlRoot: "/announcements", 
    
      defaults:  {
                   name: "",
                   content: "",
                   id: 0,
                   char_count: 0,
                   order: false,
                   cost: 0
                 },
    
  })



  app.AnnouncesCollection = Backbone.Collection.extend({

     url: '/announcements', 
     model: app.AnnounceModel 

  }) 

})(window);
  
  
   
   