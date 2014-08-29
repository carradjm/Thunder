FinalProject.Models.User = Backbone.Model.extend({
  urlRoot: "/api/songs",

  uploadedSongs: function () {
    this._uploadedSongs = this._uploadedSongs ||
      new FinalProject.Collections.Songs([], { song: this });
    return this._uploadedSongs;
  },
  
  likedSongs: function () {
    this._likedSongs = this._likedSongs ||
      new FinalProject.Collections.Songs([], { song: this });
    return this._likedSongs;
  },
  
  followers: function () {
    this._followers = this._followers ||
      new FinalProject.Collections.Comments([], { song: this });
    return this._followers;
  },
  
  following: function () {
    this._following = this._following ||
      new FinalProject.Collections.Comments([], { song: this });
    return this._following;
  },

  parse: function (response) {
    if (response.uploadedSongs) {
      this.uploadedSongs().set(response.uploadedSongs, { parse: true });
      delete response.uploadedSongs;
    }
    
    if (response.likedSongs) {
      this.likedSongs().set(response.likedSongs, { parse: true });
      delete response.likedSongs;
    }
    
    if (response.followers) {
      this.followers().set(response.followers, { parse: true });
      delete response.followers;
    }
    
    if (response.following) {
      this.following().set(response.following, { parse: true });
      delete response.following;
    }
    
    return response;
  }
});