Thunder.Views.SongsNew = Backbone.View.extend({

  template: JST['songs/new'],
  
  events: {
    'click #submit' : 'submit'
  },

  initialize: function() {
    this.listenTo(Thunder.currentUser.songLikes(), "add sync", this.render);
    this.listenTo(Thunder.currentUser.likes(), "add sync", this.render);
    this.listenTo(Thunder.currentUser, "sync", this.render)
  },

  render: function() {
    var content = this.template({song: this.model});
    this.$el.html(content);
    return this;
  },
  
})