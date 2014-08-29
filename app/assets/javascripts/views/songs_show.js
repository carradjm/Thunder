FinalProject.Views.SongsShow = Backbone.View.extend({

  template: JST['songs/show'],

  initialize: function() {},
  
  render: function() {
    var content = this.template({song: this.model});
    this.$el.html(content);
    return this;
  }
  
})