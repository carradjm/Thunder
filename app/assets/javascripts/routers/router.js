FinalProject.Routers.router = Backbone.Router.extend({
  
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
  },
  
  routes: {
    'songs' : 'index',
    'songs/new' : 'songNew',
    'songs/:id' : 'songShow',
    'users/new' : 'userNew',
    'users/:id' : 'userShow',
    'users/:id/edit' : 'userEdit'
  },
  
  index: function() {
    var indexView = new FinalProject.Views.SongsIndex({
      collection: FinalProject.songs
    });
    
    this._swapView(indexView);
  },
  
  songNew: function() {
   var song = new FinalProject.Models.Song;

   var newSongView = new FinalProject.Views.SongsForm({
     model: song
   });

   this._swapView(newSongView);
  },
  
  songShow: function(id) {
    var song = FinalProject.songs.get(id);
    var showView = new FinalProject.Views.SongsShow({
      model: song
    });

    this._swapView(showView)
  },
  
  userShow: function(id) {
    FinalProject.users = new FinalProject.Collections.Users();
    var that = this;
    FinalProject.users.fetch({
      success: function() {
        var user = FinalProject.users.get(id);
        console.log(JSON.stringify(user));
        var showView = new FinalProject.Views.UsersShow({
          model: user
        });

        that._swapView(showView)
      }
    })
  },
  
  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el)
  }
  
})