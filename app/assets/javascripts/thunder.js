window.Thunder = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    var data = JSON.parse($("#bootstrapped-json").html());

    this.currentUser = new Thunder.Models.User(data["currentUser"], { parse: true });
    this.users = new Thunder.Collections.Users(Thunder.currentUser);
    this.genres = new Thunder.Collections.Genres();
    this.songs = new Thunder.Collections.Songs();
    this.playlists = new Thunder.Collections.Playlists(Thunder.currentUser.playlists());
    this.notifications = new Thunder.Collections.Notifications();
    this.users.fetch({
      success: function() {
        Thunder.router = new Thunder.Routers.Router({
          $rootEl: $('.main')
        });
        
        audiojs.events.ready(function() {
          var ajso = audiojs.createAll();
           $('.audiojs .play-pause').on('click', function(){
              var thisIndex = $(this).parents('.audiojs').index('.audiojs');
              $.each(ajso, function(index,val){
                  if ( index == thisIndex && ajso[index].playing ) ajso[index].pause(); 
              });
          });
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