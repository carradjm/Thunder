Thunder.Models.Playlist = Backbone.Model.extend({
  urlRoot: '/api/playlists',
  
  songs: function() {
    if (!this._songs) {
      this._songs = new Thunder.Collections.Songs([], {playlist: this});
    }
    
    return this._songs;
  },
  
  playlistSongs: function() {
    if (!this._playlistSongs) {
      this._playlistSongs = new Thunder.Collections.PlaylistSongs([], {playlist: this});
    }
    
    return this._playlistSongs;
  },
  
  parse: function(response) {
    if (response.songs) {
      this.songs().set(response.songs, { parse: true });
      delete response.songs;
    }
    
    if (response.playlistSongs) {
      this.playlistSongs().set(response.playlistSongs, { parse: true });
      delete response.playlistSongs;
    }
    
    return response; 
  }
})