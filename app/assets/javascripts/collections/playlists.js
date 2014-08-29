Thunder.Collections.Playlists = Backbone.Collection.extend({
  model: Thunder.Models.Playlist,
  
  url:  '/api/playlists'
})