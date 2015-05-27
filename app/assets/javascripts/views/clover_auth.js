CloverDemo.Views.CloverAuth = Backbone.View.extend({
  template: JST['clover/auth'],

  render: function() {
    var content = this.template();
    this.$el.html(content);
    return this;
  },
  
})
