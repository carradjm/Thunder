FinalProject.Models.Song = Backbone.Model.extend({
  urlRoot: "/api/songs",

  comments: function () {
    this._comments = this._comments ||
      new FinalProject.Collections.Comments([], { song: this });
    return this._comments;
  },

  parse: function (response) {
    if (response.comments) {
      this.comments().set(response.comments, { parse: true });
      delete response.comments;
    }

    return response;
  }
});