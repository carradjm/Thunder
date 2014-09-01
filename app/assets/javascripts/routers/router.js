Thunder.Routers.Router = Backbone.Router.extend({
  
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
  },
  
  routes: {
    "" : "usersIndex",
    'songs' : 'songsIndex',
    'songs/new' : 'songNew',
    'songs/:id' : 'songShow',
    'users/new' : 'Thunder',
    'users/:id' : 'userShow',
    'users/:id/edit' : 'userEdit',
    'playlists/:id' : 'playlistShow'
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
        
      this._swapView(showView) 
    });
  },
  
  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el)
  }
  
})