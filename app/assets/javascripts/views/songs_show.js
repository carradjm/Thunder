FinalProject.Views.SongsShow = Backbone.View.extend({

  template: JST['songs/show'],
  
  events: {
    'click .add-comment' : 'addComment',
    'click .song-like' : 'likeSong'
  },

  initialize: function() {},
  
  render: function() {
    var content = this.template({song: this.model});
    this.$el.html(content);
    return this;
  }
  
})