Thunder.Models.Song = Backbone.Model.extend({
  urlRoot: "/api/songs",
  
  playlistSongs: function() {
    if (!this._playlistSongs) {
      this._playlistSongs = new Thunder.Collections.PlaylistSongs([], {});
    };
    
    return this._playlistSongs;
   },
   
  likes: function() {
    if (!this._likes) {
      this._likes = new Thunder.Collections.Likes([], {});
    };
    
    return this._likes;
  },
  
  comments: function() {
    if (!this._comments) {
      this._comments = new Thunder.Collections.Comments([], {});
    };
    
    return this._comments;
  },

  parse: function(response) {
    if (response.playlistSongs) {
      this.playlistSongs().set(response.playlistSongs, { parse: true });
      delete response.playlistSongs;
    }; 
    
    if (response.comments) {
      this.comments().set(response.comments, { parse: true });
      delete response.comments;
    };
    
    if (response.likes) {
      this.likes().set(response.likes, { parse: true });
      delete response.likes
    };
    
    return response
  }
});