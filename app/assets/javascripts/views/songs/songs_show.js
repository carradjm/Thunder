Thunder.Views.SongsShow = Backbone.View.extend({

  template: JST['songs/show'],
    
  events: {
    'submit form#add-comment' : 'addComment',
    'click #like-song' : 'likeSong',
    'click #unlike-song' : 'unlikeSong',
    'click #add-to-playlist' : 'addToPlaylist',
    'click #play-button' : 'playTrack',
    'click #pause-button' : 'pauseTrack',
  },

  initialize: function() {
    // this.listenTo(Thunder.currentUser, "sync", this.render);
    // this.listenTo(this.model, "change", this.render);
    // this.listenTo(this.model, "request", this.render);
    this.listenTo(this.model.comments(), "add destroy", this.renderComments);
    this.listenTo(Thunder.router, 'route', this.closeInterval())
    var that = this
    $('p.play').on('click', function() {
      that.playTrack();
    });
    $('p.pause').on('click', function() {
      that.pauseTrack();
    })
  },
  
  render: function() {
    var that = this;
    var content = this.template({ song: this.model });
    this.$el.html(content);
    
    var $audio = $("#audio-player");
    
    if (!$audio.attr("src")) {
      $audio.attr("src", this.model.get('track'));
      $audio[0].load();
    }
    
    this.renderComments();
            
    if (Thunder.currentUser.likes().findWhere({id: this.model.id})) {
      this.$el.find('.like-buttons').toggleClass('is-liked');
    }
    
    var playerSource = $('#audio-player').attr('src')
    var song = this.model.get('track')
    if (playerSource === song){
      if ($(".audiojs").hasClass("playing")) {
        this.$el.find('.play-pause-buttons').toggleClass('is-playing')
      }
    }
        
    var that = this;
    this.waveformInterval = setInterval(function() {
      that.renderWaveform();
    }, 400)
    
    return this;
  },
  
  closeInterval: function() {
    clearInterval(this.waveformInterval)
  },
  
  renderWaveform: function() {
    var playerSource = $('#audio-player').attr('src')
    var song = this.model.get('track')
    if (playerSource === song){
      $progress = parseInt($('.progress').attr('style').slice(7));
      $('#song-show' + this.model.id).css('width', parseInt($progress));
    }
  },
  
  renderComments: function() {
    var $commentsEl = this.$el.find('ul.comments')
    $commentsEl.empty();
    this.model.comments().forEach(function(comment) {
      var commentView = new Thunder.Views.CommentsShow({ model: comment });
      $commentsEl.append(commentView.render().$el)
    })
  },
  
  playTrack: function() {
    var $audio = $("#audio-player");
        
    if ($audio.attr("src") === this.model.get('track')) {
      $audio[0].play();
    } else {
      $audio.attr("src", this.model.get('track'));
      $audio[0].pause();
      $audio[0].load();//suspends and restores all audio element
      $audio[0].play();
    }
    
    $('#audiojs_wrapper0').toggleClass('playing')
    this.$el.find('.play-pause-buttons').toggleClass('is-playing')    
  },
  
  pauseTrack: function() {
    var audio = $("#audio-player");
    
    audio[0].pause();
    $('#audiojs_wrapper0').toggleClass('playing')
    this.$el.find('.play-pause-buttons').toggleClass('is-playing')  
  },
      
  likeSong: function() { 
    var songLike = new Thunder.Models.Like({user_id: Thunder.currentUser.id, song_id: this.model.id});
    var that = this;
    
    this.$el.find('.like-buttons').toggleClass('is-liked');
    songLike.save(null, {
      success: function() {
        Thunder.currentUser.fetch();
      }
    });
  },
  
  unlikeSong: function() { 
    var songLike = Thunder.currentUser.songLikes().findWhere({song_id: this.model.id});
    var that = this;
    this.$el.find('.like-buttons').toggleClass('is-liked');
    songLike.destroy({});
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