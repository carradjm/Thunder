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
    this.listenTo(this.model, "sync", this.render);
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
    var content = this.template({ song: this.model });
    this.$el.html(content);
    
    var $audio = $("#audio-player");
    
    var that = this;
    
    var playerSource = $('#audio-player').attr('src')
    var song = this.model.get('track')
    
    if (!$audio.attr("src")) {
      $audio.attr("src", this.model.get('track'));
      $audio[0].load();
    }
    
    this.renderComments();
            
    if (Thunder.currentUser.likes().findWhere({id: this.model.id})) {
      this.$el.find('.like-buttons').toggleClass('is-liked');
    }
    
    if (playerSource === song){
      if ($(".audiojs").hasClass("playing")) {
        this.$el.find('.play-pause-buttons').toggleClass('is-playing')
      }
    }
    
    this.$el.find('.music-player-widget').on('click', function(event) {
      var offset = $(this).offset();
      that.scrollPosition = event.clientX - offset.left
      console.log('scroll position is ' + that.scrollPosition)
      var newCurrentTime = (that.scrollPosition/1040) * $audio[0].duration
      $audio[0].currentTime = newCurrentTime
      console.log('newCurrentTime is ' + newCurrentTime)
      console.log("duration of song is " + $audio[0].duration)
      console.log('currentTime is now ' + $audio[0].currentTime)
      console.log($('div.progress').attr("style"))
    })
    
    $('p.play').on('click', function(event) {
      if (playerSource === song) {
        that.$el.find('.play-pause-buttons').toggleClass('is-playing')
        console.log("play button press - button change!")
      }
    })
    
    $('p.pause').on('click', function(event) {
      that.played = parseInt($audio[0].currentTime);
      if (playerSource === song) {
        that.$el.find('.play-pause-buttons').toggleClass('is-playing')
        console.log("pause button press - button change!")
      }
    })
        
    this.progressInterval = setInterval(function() {
      that.renderProgressBar();
    }, 400)
    
    return this;
  },
  
  closeInterval: function() {
    clearInterval(this.progressInterval)
  },
  
  renderProgressBar: function() {
    var playerSource = $('#audio-player').attr('src')
    var song = this.model.get('track')
    if (playerSource === song){
      console.log($('.progress').attr('style'))
      $progress = parseInt($('.progress').attr('style').slice(7)) * 1.116;
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
    $audio.attr("src", this.model.get('track'));
    var that = this;
    if (this.played > 0) {      
      $audio[0].load();
      setTimeout(function() {
        $audio[0].currentTime = that.played
        $audio[0].play();
        if (!$(".audiojs").hasClass("playing")) {
          $('.audiojs').toggleClass('playing')
        }
      }, 50)
    } else {
      if (!$(".audiojs").hasClass("playing")) {
        $('.audiojs').toggleClass('playing')    
        $audio[0].pause()
        $audio[0].load();//suspends and restores all audio element
        $audio[0].play();
      }
    }
        
    this.$el.find('.play-pause-buttons').toggleClass('is-playing')
  },
  
  pauseTrack: function() {
    var $audio = $("#audio-player");
    
    $audio[0].pause();
    $('#audiojs_wrapper0').toggleClass('playing')
    this.$el.find('.play-pause-buttons').toggleClass('is-playing')
    this.played = parseInt($audio[0].currentTime);
  },
      
  likeSong: function() { 
    var songLike = new Thunder.Models.Like({user_id: Thunder.currentUser.id, song_id: this.model.id});
    var that = this;
    
    this.$el.find('.like-buttons').toggleClass('is-liked');
    songLike.save(null, {
      success: function() {
        that.model.fetch();
      }
    });
  },
  
  unlikeSong: function() { 
    var songLike = Thunder.currentUser.songLikes().findWhere({song_id: this.model.id});
    var that = this;
    this.$el.find('.like-buttons').toggleClass('is-liked');
    songLike.destroy({
      success: function() {
        that.model.fetch
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