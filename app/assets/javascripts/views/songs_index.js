FinalProject.Views.SongsIndex = Backbone.View.extend({
  template: JST['songs/index'],
  
  render: function() {
    var content = this.template({songs: this.collection});
    this.$el.html(content);
    return this;
  }
})