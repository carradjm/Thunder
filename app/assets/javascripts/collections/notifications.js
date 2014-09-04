Thunder.Collections.Notifications = Backbone.Collection.extend({
  url: '/api/notifications',
  
  model: Thunder.Models.Notification
})