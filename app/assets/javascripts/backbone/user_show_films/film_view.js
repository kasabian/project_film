(function(app) {

  app.FilmView = Backbone.View.extend({

    template: JST["backbone/user_show_films/film_template"],

    tagName: "span",

    initialize: function() {

    }, 


    render: function() {

      this.removeClass();
      this.addClass();
    }

  });
  
})(window);
