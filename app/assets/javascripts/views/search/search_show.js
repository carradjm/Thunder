Thunder.Views.SearchShow = Backbone.View.extend({
  
  template: JST['search/show'],
  
  render: function() {
    var content = this.template({ results: this.model });
    this.$el.html(content);
    return this;
  }
  
})