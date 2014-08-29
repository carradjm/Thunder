window.FinalProject = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    FinalProject.songs = new FinalProject.Collections.Songs();
    FinalProject.songs.fetch({
      success: function () {
        new FinalProject.Routers.router({
         $rootEl: $(".main"),
        });
        Backbone.history.start();
      }
    });
  }
};

$(document).ready(function(){
  FinalProject.initialize();
});
