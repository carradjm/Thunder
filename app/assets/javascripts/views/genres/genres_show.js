Thunder.Views.ShowGenre = Backbone.View.extend({
  
  template: JST["genres/show"],
  
  render: function() {
    console.log("genre show go!")
    console.log(this.model.escape("name"))
    var content = this.template({ genre: this.model });
    this.$el.html(content);
    this.renderSongStreams();
    return this;
  },
  
  className: "stream-page group",
  
  renderSongStreams: function() {
    var that = this;
    console.log(this.model.songs());
    this.model.songs().forEach( function(song) {
      var streamView = new Thunder.Views.SongsStream({ model: song });
      that.$el.append(streamView.render().$el);
    });
  }  
})