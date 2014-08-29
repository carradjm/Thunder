//This form can be used for both New and Edit

FinalProject.Views.SongsForm = Backbone.View.extend({
  
  events: {
    'submit form' : 'submit'
  },
  
  template: JST['songs/form'],
  
  initialize: function() {  
    this.listenTo(this.model, 'sync', this.render)
  },
  
  render: function () {
    var content = this.template({
      song: this.model
    });
    this.$el.html(content);
    return this;
  },
  
  submit: function (event) {
    event.preventDefault();

    var attrs = $(event.target).serializeJSON();

    function success () {
      Backbone.history.navigate("", { trigger: true });
    }

    this.model.set(attrs);
    if (this.model.isNew()) {
      this.collection.create(this.model, {
        success: success,
        wait: true
      });
    } else {
      this.model.save({}, {
        success: success
      });
    }
  }
});