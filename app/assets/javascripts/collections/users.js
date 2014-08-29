Thunder.Collections.Users = Backbone.Collection.extend({
  
  model: Thunder.Models.User,
  
  url: '/api/users'
})