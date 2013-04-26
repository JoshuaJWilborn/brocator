window.BA = {
	Views: {},
	Collections: {},
	Routers: {},
	Models: {},
  Store: {},

	initialize: function() {
    console.log("initialized")
	}
}

$(function(){
  BA.initialize();
	BA.Store.UserRouter = new BA.Routers.UserRouter;
	Backbone.history.start();
})