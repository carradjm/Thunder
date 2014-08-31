Thunder.Routers.Router = Backbone.Router.extend({
  
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
  },
  
  routes: {
    'users' : 'usersIndex',
    'songs' : 'songsIndex',
    'songs/new' : 'songNew',
    'songs/:id' : 'songShow',
    'users/new' : 'Thunder',
    'users/:id' : 'userShow',
    'users/:id/edit' : 'userEdit',
    'playlists/:id' : 'playlistShow'
  },
  
  index: function() {
    var indexView = new Thunder.Views.SongsIndex({
      collection: Thunder.songs
    });
    
    this._swapView(indexView);
  },
  
  songNew: function() {
   var song = new Thunder.Models.Song;

   var newSongView = new Thunder.Views.SongsForm({
     model: song
   });

   this._swapView(newSongView);
  },
  
  songShow: function(id) {
    var song = Thunder.songs.getOrFetch(id);
    
  
    var showView = new Thunder.Views.SongsShow({
      model: song
    });
    
    console.log(showView.model.get('title'))
        
    this._swapView(showView);
  },
  
  userShow: function(id) {
    var user = Thunder.users.getOrFetch(id);

    var showView = new Thunder.Views.UsersShow({
      model: user
    });
    
    this._swapView(showView)
  },
  
  playlistShow: function(id) {
    var playlist = Thunder.playlists.getOrFetch(id);
    
    var showView = new Thunder.Views.PlaylistsShow({
      model: playlist
    });
        
    this._swapView(showView) 
  },
  
  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el)
  }
  
})