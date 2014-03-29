Testpilot.addInitializer (options) ->
  new Testpilot.Routers.AppsRouter()
  new Testpilot.Routers.BuildsRouter()
  new Testpilot.Routers.AssignmentsRouter()
  Backbone.history.start()
