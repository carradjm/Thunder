Thunder.Routers.Router = Backbone.Router.extend({
  
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
  },
  
  routes: {
    "" : "stream",
    "search?q=:query": "search",
    'users' : 'usersIndex',
    'notifications' : 'notificationsIndex',
    'songs/new' : 'songNew',
    'songs/:id' : 'songShow',
    'users/:id' : 'userShow',
    'users/:id/edit' : 'userEdit',
    'playlists/:id' : 'playlistShow'    
  },
  
  stream: function() {
    var streamView = new Thunder.Views.StreamShow();
    
    this._swapView(streamView);
  },
  
  search: function(query) {
    var that = this;
 
   $.ajax({
     url: '/api/search',
     type: 'GET',
     data: {
       query: query
     },
     success: function (data) {
       // that.$subHeader.html("<h2 class='search-header'>Showing results for: " + terms + "</h2>");
       var results = new Thunder.Models.SearchResult(data, { parse: true })
       var searchView = new Thunder.Views.SearchShow({model: results});
       that._swapView(searchView);
     }
   });
  },
  
  usersIndex: function() {
    var that = this;
    
    Thunder.users.fetch({
      success: function() {
        var indexView = new Thunder.Views.UsersIndex({
          collection: Thunder.users
        });
    
        that._swapView(indexView);
      }
    });
  },
  
  notificationsIndex: function() {
    var that = this;
    console.log('now here!')
    Thunder.notifications.fetch({
      success: function() {
        console.log('and now')
        var notificationsIndex = new Thunder.Views.NotificationsIndex({
          collection: Thunder.notifications
        });

        that._swapView(notificationsIndex);
      }
    })
  },
    
  songNew: function() {
   var song = new Thunder.Models.Song;

   var newSongView = new Thunder.Views.SongsForm({
     model: song
   });

   this._swapView(newSongView);
  },
  
  songShow: function(id) {
    var that = this;
    var song = Thunder.songs.getOrFetch(id, function(song) {
      var showView = new Thunder.Views.SongsShow({
        model: song
      });
            
      that._swapView(showView);
    });    
  },
  
  userShow: function(id) {
    var that = this;
    var user = Thunder.users.getOrFetch(id, function(user) {
      var showView = new Thunder.Views.UsersShow({
        model: user
      });
      
      that._swapView(showView);
    });
  },
  
  playlistShow: function(id) {
    var that = this;
    var playlist = Thunder.playlists.getOrFetch(id, function(playlist) {
      var showView = new Thunder.Views.PlaylistsShow({
        model: playlist
      });
      console.log(playlist.songs())
      that._swapView(showView) 
    });
  },
  
  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el)
  }
  
})