window.Thunder = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    var data = JSON.parse($("#bootstrapped-json").html());

    this.currentUser = new Thunder.Models.User(data["currentUser"], { parse: true });
    this.users = new Thunder.Collections.Users(Thunder.currentUser);
    this.songs = new Thunder.Collections.Songs();
    this.playlists = new Thunder.Collections.Playlists(Thunder.currentUser.playlists());
    
    var router = new Thunder.Routers.Router({
      $rootEl: $('.main')
    });
    
    Backbone.history.start();
  }
};