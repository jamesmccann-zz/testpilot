Testpilot.addInitializer (options) ->
  @router = new Testpilot.Routers.AppRouter()
  Backbone.history.start()
