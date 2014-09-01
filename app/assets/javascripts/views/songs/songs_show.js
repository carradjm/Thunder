Thunder.Views.SongsShow = Backbone.View.extend({

  template: JST['songs/show'],
  
  events: {
    'click .add-comment' : 'addComment',
    'click #like-song' : 'likeSong',
    'click #unlike-song' : 'unlikeSong'
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
  
  likeSong: function() {
    var songLike = new Thunder.Models.Like({user_id: Thunder.currentUser.id, song_id: this.model.id});
    var that = this;
    
    songLike.save(null, {
      success: function() {
        console.log('here!')
        Thunder.currentUser.fetch();
      }
    });
  },
  
  unlikeSong: function() {   
    var songLike = Thunder.currentUser.songLikes().findWhere({song_id: this.model.id});
    
    songLike.destroy({
      success: function() {
        console.log('hello!')
        Thunder.currentUser.fetch();
      } 
    });
  }  
})