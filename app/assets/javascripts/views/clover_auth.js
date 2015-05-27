CloverDemo.Views.CloverAuth = Backbone.View.extend({
  template: JST['clover/auth'],

  events: {
    'click button.get_auth': 'getAuth'
  },

  render: function() {
    var content = this.template();
    this.$el.html(content);
    return this;
  },

  getAuth: function(e) {
    e.preventDefault()
    window.location = "https://clover-demo.herokuapp.com/clover/authorize"
  }

})
