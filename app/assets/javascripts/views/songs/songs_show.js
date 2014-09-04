Thunder.Views.SongsShow = Backbone.View.extend({

  template: JST['songs/show'],
    
  events: {
    'submit form#add-comment' : 'addComment',
    'click #like-song' : 'likeSong',
    'click #unlike-song' : 'unlikeSong',
    'click #add-to-playlist' : 'addToPlaylist',
    'click #play-button' : 'playTrack',
    'click #pause-button' : 'pauseTrack'
  },

  initialize: function() {
    this.listenTo(Thunder.currentUser, "sync", this.render);
    this.listenTo(this.model, "sync", this.render);
    this.listenTo(this.model.comments(), "sync add", this.render);
    var that = this
    $('p.play').on('click', function() {
      that.playTrack();
    });
    $('p.pause').on('click', function() {
      that.pauseTrack();
    })
  },
  
  render: function() {
    var content = this.template({song: this.model});
    this.$el.html(content);
    var audio = $("#audio-player");
    if (!$('#audio-player').attr("src")) {
      $("#audio-player").attr("src", this.model.get('track'));
      audio[0].load();//suspends and restores all audio element
    }
    var $waveformEl = this.$el.find('div.waveform')
    this.renderComments();
    window.setInterval(function() {
      $progress = $('.progress').attr('style').slice(7)
      $('.waveform-progress-bar').css('width', parseInt($progress))
    }, 400)
    return this;
  },
  
  renderWaveform: function() {
    var waveform = new Thunder.Views.Waveform({model: this.model});
    var $waveformEl = this.$el.find('div.waveform')
    $waveformEl.html(waveform.render().$el)
  },
  
  renderComments: function() {
    var $commentsEl = this.$el.find('ul.comments')
    this.model.comments().forEach(function(comment) {
      var commentView = new Thunder.Views.CommentsShow({ model: comment });
      $commentsEl.append(commentView.render().$el)
    })
  },
  
  playTrack: function() {
    var audio = $("#audio-player");
        
    if ($('#audio-player').attr("src") === this.model.get('track')) {
      audio[0].play();
    } else {
      $("#audio-player").attr("src", this.model.get('track'));
      audio[0].pause();
      audio[0].load();//suspends and restores all audio element
      audio[0].play();
    }
    
    $('#audiojs_wrapper0').addClass('playing')
    $('#play-button').css('display', 'none')
    $('#pause-button').css('display', 'block')
  },
  
  pauseTrack: function() {
    var audio = $("#audio-player");
    
    audio[0].pause();
    $('#pause-button').css('display', 'none')
     $('#play-button').css('display', 'block')
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
    
  addComment: function(event) {
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