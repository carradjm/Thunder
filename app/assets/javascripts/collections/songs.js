Thunder.Collections.Songs = Backbone.Collection.extend({
  model: Thunder.Models.Song,
  
  url: "/api/songs",
    
  getOrFetch: function (id) {
      var song = this.get(id);

      if(!song) {
        song = new Thunder.Models.Song({ id: id });
        song.fetch({
          success: function () {
            Thunder.songs.add(song).bind(this);
          }
        });
      } else {
        song.fetch();
      }
      
      return song;
    }
})