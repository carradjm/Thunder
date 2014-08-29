Thunder.Views.UsersShow = Backbone.View.extend({
  
  template: JST['users/show'],
  
  events: {
    'click .add-comment' : 'addComment',
    'click .song-like' : 'likeSong'
  },

  initialize: function() {},
  
  render: function() {
    var content = this.template({user: this.model});
    this.$el.html(content);
    return this;
  }
  
})