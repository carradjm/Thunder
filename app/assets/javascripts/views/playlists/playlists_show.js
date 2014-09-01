Thunder.Views.PlaylistsShow = Backbone.View.extend({

  template: JST['playlists/show'],
  
  events: {
    "click #remove-song" : "removeSong"
  },

  initialize: function() {
    this.listenTo(this.model, 'sync add destroy', this.render)
  },
  
  render: function() {
    var content = this.template({playlist: this.model});
    this.$el.html(content);
    return this;
  },
  
  removeSong: function(event) {
    event.preventDefault();
    var songId = $(event.currentTarget).attr('data-id');
    
    var that = this;
    var playlistSong = this.model.playlistSongs().findWhere({song_id: parseInt(songId)})
    playlistSong.destroy({
      success: function() {
        that.model.fetch();
      } 
    });
  }
  
})