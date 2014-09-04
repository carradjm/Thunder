Thunder.Views.SongsStream = Backbone.View.extend({

  template: JST['songs/stream'],
    
  events: {
    'click .add-comment' : 'addComment',
    'click #like-song' : 'likeSong',
    'click #unlike-song' : 'unlikeSong',
    'click #add-to-playlist' : 'addToPlaylist',
    'click #music-player-widget' : 'changeTrack'
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
  
  changeTrack: function() {
    var audio = $("#audio-player");
        
    $("#audio-player").attr("src", this.model.get('track'));
    audio[0].pause();
    audio[0].load();//suspends and restores all audio element
    audio[0].play();
    
    $('.audiojs').removeClass('playing')
    $('.audiojs').addClass('playing')
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