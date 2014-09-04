Thunder.Views.SongsShow = Backbone.View.extend({

  template: JST['songs/show'],
    
  events: {
    'submit form#add-comment' : 'submit',
    'click #like-song' : 'likeSong',
    'click #unlike-song' : 'unlikeSong',
    'click #add-to-playlist' : 'addToPlaylist',
    'click #music-player-widget' : 'changeTrack'
  },

  initialize: function() {
    this.listenTo(Thunder.currentUser, "sync", this.render);
    this.listenTo(this.model, "sync", this.render);
    this.listenTo(this.model.comments(), "sync add", this.render);
  },
  
  render: function() {
    var content = this.template({song: this.model});
    this.$el.html(content);
    var that = this;
    this.renderComments();
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
  
  renderComments: function() {
    var $commentsEl = this.$el.find('ul.comments')
    this.model.comments().forEach(function(comment) {
      var commentView = new Thunder.Views.CommentsShow({ model: comment });
      $commentsEl.append(commentView.render().$el)
    })
  },
  
  submit: function(event) {
    var that = this;
		event.preventDefault();

		var params = $(event.currentTarget).serializeJSON()
		var comment = new Thunder.Models.Comment(params);
    
	  comment.save({}, {
      success: function() {
          that.model.comments().add(comment);
          that.model.fetch();
        that.$("text[name=comment\\[body\\]]").val("");
      }
    });
  },
    
  addToPlaylist: function() {
    var playlistAdd = new Thunder.Views.PlaylistsAdd({ song: this.model });
    this.$el.html(playlistAdd.render().$el);
  }  
})