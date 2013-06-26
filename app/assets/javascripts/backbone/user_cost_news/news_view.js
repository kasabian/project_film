
(function(app) {

   app.NewsView = Backbone.View.extend({

    template: JST["backbone/user_cost_news/news_template"],
    tagName: "tr",

    events: {
      "click" : "changeOrder"
    },

    initialize: function() {
        this.setCharCount();
        this.setOrdered();
    },

    setOrdered: function() {         
       if(this.model.get("order")) {
         this.$el.addClass("success");
       } else {
         this.$el.removeClass("success");
       }
    },
     
    changeOrder: function() {
      var is_order = this.model.get("order");
      
      is_order = is_order ? false: true; 
       
      this.model.set({order:is_order}); 
      
      this.model.save();

      this.setOrdered();

      this.trigger("change_order",this);
    }, 

    setCharCount: function() {
      var str = $.trim(this.model.get("content").stripTags());
      //    str_arr = str.split(" "),
      //    char_count = 0;

     // _.each(str_arr,function(val){
      //   char_count = char_count + $.trim(val).length;

     // },this);    

      this.model.set({
                       char_count: str.length
                    });
    },

    render: function() {
      
      this.$el.html(this.template(this.model.toJSON()));
      return this;
    }

  });
})(window);