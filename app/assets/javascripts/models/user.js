Thunder.Models.User = Backbone.Model.extend({
  urlRoot: "/api/users",
  
  uploads: function() {
    if(!this._uploads) {
      this._uploads = new Thunder.Collections.Songs([], { user: this });
    }

    return this._uploads;
  },
  
  likes: function() {
    if(!this._likes) {
      this._likes = new Thunder.Collections.Songs([], { user: this });
    }

    return this._likes;
  },
  
  playlists: function() {
    if(!this._playlists) {
      this._playlists = new Thunder.Collections.Playlists([], { user: this });
    }

    return this._playlists;
  },
  
  followers: function() {
    if(!this._followers) {
      this._followers = new Thunder.Collections.Users([], { user: this });
    }

    return this._followers;
  },
  
  following: function() {
    if(!this._following) {
      this._following = new Thunder.Collections.Users([], { user: this });
    }

    return this._following;
  },
  
  parse: function(response) {
    if(response.uploads) {
      this.uploads().set(response.uploads, { parse: true });
      delete response.uploads;
    }
    
    if(response.likes) {
      this.likes().set(response.likes, { parse: true });
      delete response.likes;
    }
    
    if(response.playlists) {
      this.playlists().set(response.playlists, { parse: true });
      delete response.playlists;
    }
    if(response.following) {
      this.following().set(response.following, { parse: true });
      delete response.following;
    }
    if(response.followers) {
      this.followers().set(response.followers, { parse: true });
      delete response.followers;
    }
    
    return response;
  }
})