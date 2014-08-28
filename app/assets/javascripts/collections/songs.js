FinalProject.Collections.Songs = Backbone.Collection.extend({
  model: FinalProject.Models.Song,
  
  url: "/api/songs"
})