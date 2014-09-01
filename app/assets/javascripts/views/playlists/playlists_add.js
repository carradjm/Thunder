Thunder.Views.PlaylistsAdd = Backbone.View.extend({
  template: JST['playlists/add'],
  
  events: {
    "click #add-playlist-song" : "addPlaylistSong"
  },
  
  initialize: function(options) {
    this.song = options.song;
  },
  
  render: function() {
    var content = this.template({song: this.song});
    this.$el.html(content);
    return this;
  },
  
  addPlaylistSong: function(event) {
    var $id = $(event.currentTarget).attr('data-id')
    var playlistSong = new Thunder.Models.PlaylistSong({ playlist_id: $id, song_id: this.song.id });
    
    playlistSong.save(null, {
      success: function() {
        Thunder.currentUser.fetch();
      }
    })
  }
})