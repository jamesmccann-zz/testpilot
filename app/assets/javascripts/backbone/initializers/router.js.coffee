Testpilot.addInitializer (options) ->
  @router = new Testpilot.Routers.AppsRouter()
  Backbone.history.start()
