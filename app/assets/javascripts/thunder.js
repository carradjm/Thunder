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
    this.notifications = new Thunder.Collections.Notifications();
    this.users.fetch({
      success: function() {
        Thunder.router = new Thunder.Routers.Router({
          $rootEl: $('.main')
        });
        
        audiojs.events.ready(function() {
          audioPlayerJS = audiojs.createAll();
        });
        
        $(".search-box").keyup(function(event){
          if (event.keyCode == 13) {
            $(".search-button").click();
          }
        });
    
        $('.search-button').on('click', function (event) { 
           var terms = $('.search-box').val();
           Thunder.router.navigate("#/search?q=" + terms, {trigger: true});
         });
  
        Backbone.history.start();
      }
    })    
  }
};