Thunder.Collections.Likes = Backbone.Collection.extend({
  model: Thunder.Models.Like,
  
  url: "/api/song_likes",
  
  getOrFetch: function (id) {
      var like = this.get(id);

      if(!like) {
        like = new Thunder.Models.Like({ id: id });
        like.fetch({
          success: function () {
            Thunder.songLikes.add(like)
          }
        });
      } else {
        like.fetch();
      }
      
      return like;
    }
})