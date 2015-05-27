window.CloverDemo = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    this.router = new CloverDemo.Routers.Router({ $el: $('#main')});
    Backbone.history.start();
  }
};
