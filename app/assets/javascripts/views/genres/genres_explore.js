Thunder.Views.ExploreGenres = Backbone.View.extend({
  
  template: JST["genres/explore"],
  
  render: function() {
    var content = this.template({ genres: this.collection });
    this.$el.html(content);
    return this;
  },
  
  tagName: "ul"
  
})