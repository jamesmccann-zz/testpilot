Testpilot.addInitializer (options) ->
  @router = new Testpilot.Routers.BaseRouter()
  new Testpilot.Routers.AppsRouter()
  new Testpilot.Routers.BuildsRouter()
  Backbone.history.start()
