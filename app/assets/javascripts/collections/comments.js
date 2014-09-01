Thunder.Collections.Comments = Backbone.Collection.extend({
  model: Thunder.Models.Comment,
  
  url: '/api/comments'
})