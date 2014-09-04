Thunder.Views.Waveform = Backbone.View.extend({
  
  template: JST['waveform/show'],
  
  render: function() {
    var content = this.template({ song: this.model })
    this.$el.html(content);
    $progress = $('.progress').attr('style').slice(7)
    $('#waveform-progress-bar').css('width', parseInt($progress))
    return this
  }
})