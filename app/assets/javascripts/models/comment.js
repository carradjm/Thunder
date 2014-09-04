Thunder.Models.Comment = Backbone.Model.extend({
  urlRoot: '/api/comments',
  
  initialize: function(options) {
    this.song = options.song
  }
})