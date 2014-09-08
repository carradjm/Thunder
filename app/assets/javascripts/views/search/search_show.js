Thunder.Views.SearchShow = Backbone.View.extend({
  
  template: JST['search/show'],
  
  initialize: function(options) {
    this.query = options.query
  },
  
  render: function() {
    console.log(this.query)
    var content = this.template({ results: this.model, query: this.query });
    this.$el.html(content);
    return this;
  }
  
})