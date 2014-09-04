Thunder.Views.StreamShow = Backbone.View.extend({
  template: JST['stream/show'],
  
  render: function() {
    var content = this.template();
    this.renderSongStreams();
    this.$el.append(content);
    return this;
  },
  
  className: "stream-page group",
  
  renderSongStreams: function() {
    var that = this;
    
    Thunder.currentUser.following().forEach(function(user) {
      user.fetch({
        success: function() {
          if (user.uploads()) {
            user.uploads().forEach(function(song) {
              var streamView = new Thunder.Views.SongsStream({ model: song });
              that.$el.append(streamView.render().$el);
            });
          }
        }
      });
    });
  }
})