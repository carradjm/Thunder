Thunder.Collections.Playlists = Backbone.Collection.extend({
  model: Thunder.Models.Playlist,
  
  url:  '/api/playlists',
  
  getOrFetch: function (id, callback) {
    var playlist = this.get(id);

    if(!playlist) {
      playlist = new Thunder.Models.Playlist({ id: id });
      playlist.fetch({
        success: function () {
          Thunder.playlists.add(playlist);
          callback(playlist)
        }
      });
    } else {
      playlist.fetch({
        success: callback(playlist)
      });
    }
  }
})