Thunder.Collections.Users = Backbone.Collection.extend({
  
  model: Thunder.Models.User,
  
  url: '/api/users',
  
  getOrFetch: function (id, callback) {
    var user = this.get(id);

    if(!user) {
      user = new Thunder.Models.User({ id: id });
      user.fetch({
        success: function () {
          Thunder.users.add(user)
          callback(user)
        }
      });
    } else {
      user.fetch({
        success: callback(user)
      }
      );
    }
  }
})