Thunder.Collections.PlaylistSongs = Backbone.Collection.extend({
  model: Thunder.Models.PlaylistSong,
  
  url: "/api/playlist_songs"
})