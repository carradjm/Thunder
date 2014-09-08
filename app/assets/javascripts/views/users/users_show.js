Thunder.Views.UsersShow = Backbone.View.extend({
  
  template: JST['users/show'],
  
  events: {
    'click #follow' : 'followUser',
    'click #unfollow' : 'unfollowUser'
  },
  
  className: 'user-show-page group',

  initialize: function() {
    // this.listenTo(Thunder.currentUser, "add sync", this.render);    
  },
  
  render: function() {
    var content = this.template({user: this.model});
    this.$el.html(content);
    this.renderUploads();
    if (Thunder.currentUser.following().findWhere({ id: this.model.id })) {
      this.$el.find('.follow-buttons').toggleClass('followed');
    }
    return this;
  },
  
  renderUploads: function() {
    var that = this;
    var $songStreamEl = this.$el.find('.user-show-stream')
    this.model.uploads().forEach( function(song) {
      var songStream = new Thunder.Views.SongsStream({model: song});
      $songStreamEl.append(songStream.render().$el);
    }) 
  },
  
  followUser: function() {
    var userFollow = new Thunder.Models.UserFollow({follower_id: Thunder.currentUser.id, following_id: this.model.id});
    var that = this;
    
    this.$el.find('.follow-buttons').toggleClass('followed')
    userFollow.save(null, {
      success: function() {
        Thunder.currentUser.fetch();
      }
    });
  },
  
  unfollowUser: function() {
    var userFollow = Thunder.currentUser.userFollows().findWhere({following_id: this.model.id});
    this.$el.find('.follow-buttons').toggleClass('followed')
    userFollow.destroy();
  }
  
})