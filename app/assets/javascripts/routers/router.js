Thunder.Routers.Router = Backbone.Router.extend({
  
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
  },
  
  routes: {
    'songs' : 'index',
    'songs/new' : 'songNew',
    'songs/:id' : 'songShow',
    'users/new' : 'Thunder',
    'users/:id' : 'userShow',
    'users/:id/edit' : 'userEdit'
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
   Thunder

    this._swapView(showView)
  },
  
  userShow: function(id) {
    Thunder.users = new Thunder.Collections.Users();
    var that = this;
    Thunder.users.fetch({
      success: function() {
        var user = Thunder.users.get(id);
        var showView = new Thunder.Views.UsersShow({
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