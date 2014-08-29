window.Thunder = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    var $currentUserId = $('#current-user-id').attr('data-id');
    var user = new Thunder.Models.User({id: $currentUserId});
    user.fetch({
      success: function() {
        console.log(JSON.stringify(user));
        console.log(JSON.stringify(user.likes()))
        console.log(JSON.stringify(user.playlists()))
      }
    });
    
  }
};

$(document).ready(function(){
  Thunder.initialize();
});
