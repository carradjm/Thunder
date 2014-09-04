Thunder.Models.SearchResults = Backbone.Model.extend({
  
  songs: function() {
    if (!this._songs) {
      this._songs = new Thunder.Collections.Songs([], {});
    }
    
    return this._likes;
  },
  
  users: function() {
    if (!this._users) {
      this._users = new Thunder.Collection.Users([], {}) 
    };
    
    return this._users
  },
  
  parse: function(response) {
    if (response.songs) {
      this.songs().set(response.songs, { parse: true} );
      delete response.songs
    }
    
    if (response.users) {
      this.users().set(response.users, { parse: true} );
      delete response.users
    }
    
    return response
  }
  
})