Thunder.Views.UsersIndex = Backbone.View.extend({
  
  template: JST['users/index'],
  
  events: {
    'click .add-comment' : 'addComment',
    'click .song-like' : 'likeSong'
  },
  
  render: function() {
    var content = this.template({users: this.collection});
    this.$el.html(content);
    return this;
  }
  
})