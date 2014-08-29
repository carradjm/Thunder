window.Thunder = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    var router = new Thunder.Routers.Router({
      $rootEl: $('.main')
    });
    
    Backbone.history.start();
  }
};

$(document).ready(function(){
  Thunder.initialize();
});
