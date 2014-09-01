Thunder.Views.UsersShow = Backbone.View.extend({
  
  template: JST['users/show'],
  
  events: {
    'click #follow' : 'followUser',
    'click #unfollow' : 'unfollowUser'
  },

  initialize: function() {
    this.listenTo(Thunder.currentUser.following(), "add sync", this.render);
    this.listenTo(Thunder.currentUser, "sync", this.render)
  },
  
  render: function() {
    var content = this.template({user: this.model});
    this.$el.html(content);
    return this;
  },
  
  followUser: function() {
    var userFollow = new Thunder.Models.UserFollow({follower_id: Thunder.currentUser.id, following_id: this.model.id});
    var that = this;
    
    userFollow.save(null, {
      success: function() {
        Thunder.currentUser.fetch();
      }
    });
  },
  
  unfollowUser: function() {
    var userFollow = Thunder.currentUser.userFollows().findWhere({following_id: this.model.id});
    
    userFollow.destroy({
      success: function() {
        console.log('hello!')
        Thunder.currentUser.fetch();
      } 
    });
  }
  
})