(function(app) { 

  app.FilmsView = Backbone.View.extend({

    template: JST["backbone/user_show_films/films_template"],
  
    initialize: function() {
      this.films = new app.FilmsCollection();

      this.films.on("reset",this.addAllFilms,this);
      
      this.films.fetch();
    },

    addAllFilms: function() {
      this.films.each(this.addOneFilm,this);       
    },

    addOneFilm: function(model) {
      model.set({name:"Абуд Хаби"});
      model.save();
    },
    
    render: function() {     
      this.$el.html(this.template());
      return this;
    }

  });


})(window);