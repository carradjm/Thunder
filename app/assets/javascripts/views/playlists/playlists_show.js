Thunder.Views.PlaylistsShow = Backbone.View.extend({

  template: JST['playlists/show'],
  
  events: {
  },

  initialize: function() {},
  
  render: function() {
    var content = this.template({playlist: this.model});
    this.$el.html(content);
    return this;
  }
  
})