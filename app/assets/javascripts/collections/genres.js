Thunder.Collections.Genres = Backbone.Collection.extend({
  
  url: "/api/genres",
  
  model: Thunder.Models.Genre,
  
  getOrFetch: function (id, callback) {
    var genre = this.get(id);
    
    if(!genre) {
      genre = new Thunder.Models.Genre({ id: id });
      genre.fetch({
        success: function () {
          Thunder.genres.add(genre)
          callback(genre)
        }
      });
    } else {
      genre.fetch({
        success: callback(genre)
      });
    }
  }
  
})