Thunder.Views.SongsShow = Backbone.View.extend({

  template: JST['songs/show'],
    
  events: {
    'click .add-comment' : 'addComment',
    'click #like-song' : 'likeSong',
    'click #unlike-song' : 'unlikeSong',
    'click #add-to-playlist' : 'addToPlaylist'
  },

  initialize: function() {
    this.listenTo(Thunder.currentUser.songLikes(), "add sync", this.render);
    this.listenTo(Thunder.currentUser.likes(), "add sync", this.render);
    this.listenTo(Thunder.currentUser, "sync", this.render)
  },
  
  render: function() {
    var content = this.template({song: this.model});
    this.$el.html(content);
    return this;
  },
  
  waveform: function() {
    // var waveform = new Waveform({
   //    container: document.getElementById("music-player-widget"),
   //    data: [1, 0.2, 0.5]
   //  });
  },
    
  likeSong: function() {
    var songLike = new Thunder.Models.Like({user_id: Thunder.currentUser.id, song_id: this.model.id});
    var that = this;
    
    songLike.save(null, {
      success: function() {
        Thunder.currentUser.fetch();
      }
    });
  },
  
  unlikeSong: function() {   
    var songLike = Thunder.currentUser.songLikes().findWhere({song_id: this.model.id});
    
    songLike.destroy({
      success: function() {
        Thunder.currentUser.fetch();
      } 
    });
  },
  
  addToPlaylist: function() {
    var playlistAdd = new Thunder.Views.PlaylistsAdd({ song: this.model });
    this.$el.html(playlistAdd.render().$el);
  }  
})