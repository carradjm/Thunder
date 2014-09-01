Thunder.Collections.UserFollows = Backbone.Collection.extend({
  
  model: Thunder.Models.UserFollow,
 
  url: "/api/user_follows"
  
})