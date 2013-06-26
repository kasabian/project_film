
(function(app) {

   app.UserFormView = Backbone.View.extend({

    template: JST["backbone/user_harakter/user_form_template"],

    events: {
      "click #save_user_harakter" : "saveHarakter"
    },

 
    initialize: function() {
      this.model.fetch( {data : { id : window.this_page_user_id } } );
      this.model.on("change",this.render,this);

    },

    saveHarakter: function() {
      var text = this.$el.find("#harakter_text").val();

      text = $.trim(text);

      this.model.set({harakter: text});
      this.model.save();

      this.$el.find("#alert").show(700,function(){
        $("#alert").hide(700);
      });
    },

    render: function() {
      this.$el.html("");
      this.$el.append(this.template(this.model.toJSON()));
      this.$el.find("#alert").hide();
      return this;
    }

  });
})(window);