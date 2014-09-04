Thunder.Views.NotificationsIndex = Backbone.View.extend({
  template: JST['notifications/index'],
  
  render: function() {
    console.log('here!')
    var content = this.template({ notifications: this.collection });
    console.log('now here!')
    this.$el.html(content);
    return this
  }
})