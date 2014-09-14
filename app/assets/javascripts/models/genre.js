Thunder.Models.Genre = Backbone.Model.extend({
  
  urlRoot: "/api/genres",
  
  songs: function() {
    if (!this._songs) {
      this._songs = new Thunder.Collections.Songs([]);
    }
    
    return this._songs;
  },
  
  parse: function(response) {
    if (response.songs) {
      this.songs().set(response.songs, { parse: true });
      delete response.songs;
    }
    
    return response; 
  }
})