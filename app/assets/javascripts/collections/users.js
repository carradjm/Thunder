Thunder.Collections.Users = Backbone.Collection.extend({
  
  model: Thunder.Models.User,
  
  url: '/api/users',
  
  getOrFetch: function (id) {
      var user = this.get(id);

      if(!user) {
        user = new Thunder.Models.User({ id: id });
        user.fetch({
          success: function () {
            Thunder.users.add(user).bind(this);
          }
        });
      } else {
        user.fetch();
      }

      return user;
    }
})