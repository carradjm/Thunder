Thunder.Views.PlaylistsShow = Backbone.View.extend({

  template: JST['playlists/show'],
  
  events: {
    "click .remove-song" : "removeSong"
  },

  initialize: function() {},
  
  render: function() {
    var content = this.template({playlist: this.model});
    this.$el.html(content);
    return this;
  },
  
  removeSong: function(event) {
    event.preventDefault();
    var songId = $(event.currentTarget).attr('data-id');
    var playlistSong = this.model.playlistSongs().get(songId)
    
    console.log(this.model)
  }
  
})