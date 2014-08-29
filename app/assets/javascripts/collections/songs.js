Thunder.Collections.Songs = Backbone.Collection.extend({
  model: Thunder.Models.Song,
  
  url: "/api/songs",
  
  initialize: function(options) {
    this.user = options.user
  }
})