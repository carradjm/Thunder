Thunder.Views.CommentsShow = Backbone.View.extend({
  
  events: {
    'click button.remove-comment' : 'removeComment'
  },
  
  template: JST['comments/show'],
  
  tagName: 'li',
  
  className: "group",
  
  render: function() {
    var content = this.template({ comment: this.model });
    this.$el.html(content);
    return this;
  },
  
  removeComment: function() {
    var comment = this.model;
    var song = comment.get('song')
    comment.destroy({
      success: function() {
        song.fetch();
      }
    })
  }
})