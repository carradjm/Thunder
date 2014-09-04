Thunder.Views.CommentsShow = Backbone.View.extend({
  
  template: JST['comments/show'],
  
  tagName: 'li',
  
  className: "group",
  
  render: function() {
    var content = this.template({ comment: this.model });
    this.$el.html(content);
    return this;
  }
})