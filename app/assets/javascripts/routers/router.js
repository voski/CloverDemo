CloverDemo.Routers.Router = Backbone.Router.extend({
  initialize: function (options) {
    this.$el = options.$el
    this.addCloverAuth();
  },

  addCloverAuth: function(){
    var view = new CloverDemo.Views.CloverAuth();
    $('.clover-auth').html(view.render().$el)
  },
})
