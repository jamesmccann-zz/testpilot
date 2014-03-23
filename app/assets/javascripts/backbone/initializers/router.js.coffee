Testpilot.addInitializer (options) ->
  new Testpilot.Routers.AppsRouter()
  new Testpilot.Routers.BuildsRouter()
  Backbone.history.start()
