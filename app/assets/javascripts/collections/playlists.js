Thunder.Collections.Playlists = Backbone.Collection.extend({
  model: Thunder.Models.Playlist,
  
  url:  '/api/playlists',
  
  getOrFetch: function (id) {
      var playlist = this.get(id);

      if(!playlist) {
        playlist = new Thunder.Model.Playlist({ id: id });
        playlist.fetch({
          success: function () {
            Thunder.playlists.add(playlist).bind(this);
          }
        });
      } else {
        playlist.fetch();
      }

      return playlist;
    }
})