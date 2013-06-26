(function(app) { 

  app.FilmsCostView = Backbone.View.extend({

    template: JST["backbone/user_cost_films/films_template"],

    count_char: 0,
    is_show: false,
    cost: 0, 

    events: {
      "click .hide_show" : "hide_show",
      "click .cost_calc" : "calckCost"
    },
  
    initialize: function() {

      this.render();
      
      this.films = new app.FilmsCollection();

      this.films.on("reset",this.addAllFilms,this);

      this.films.fetch({data : {id: window.this_page_user_id }});

      this.$el.find(".table").hide();
    },

    calckCost: function() {

      this.cost = this.$el.find(".cost_val").val();
      this.count_char = 0;
      
      this.$el.html("");
      this.render();
      
      this.is_show ? this.$el.find(".table").show() : this.$el.find(".table").hide();
     
      this.$el.find(".cost_val").val(this.cost);

      this.addAllFilms();
    },

    hide_show: function() {

      if (this.is_show) {
          this.is_show = false;
          this.$el.find(".table").hide(1000);
      } else {
          this.is_show = true;
          this.$el.find(".table").show(1000);
      }
      
    },

    addAllFilms: function() {
      this.films.each(this.addOneFilm,this);

      cost = ((this.count_char/1000)*this.cost).toPrecision(2);
  
      this.$el.find(".all_char").html(this.count_char); 
      this.$el.find(".all_cost").html(cost); 
    },

    addOneFilm: function(model) {

      var view = new app.FilmCostView({model:model}),
          count_char =  view.model.get("char_count"),
          cost;

      cost = ((count_char/1000)*this.cost).toPrecision(2);

      view.model.set({cost:cost})    

      view.on("change_order",this.recount,this);

      this.$el.find(".table").append(view.render().el) 
       
      if (view.model.get("order") == false)  {
                                               this.count_char = this.count_char + view.model.get("char_count");
                                             };

     }, 

     recount: function(view) {
      var is_order = view.model.get("order"),
           count =  view.model.get("char_count")
           cost = 0;
       
       this.count_char = is_order ? this.count_char - count : this.count_char + count;
       
       cost = ((this.count_char/1000)*this.cost).toPrecision(2);

       this.$el.find(".all_char").html(this.count_char);
       this.$el.find(".all_cost").html(cost);    
     },
    
    render: function() {     
      this.$el.append(this.template());
      return this;
    }

  });


})(window);