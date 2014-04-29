Testpilot.addInitializer (options) ->
  Testpilot.router = new Testpilot.Routers.BaseRouter()
  new Testpilot.Routers.AppsRouter()
  new Testpilot.Routers.BuildsRouter()
  Backbone.history.start()
