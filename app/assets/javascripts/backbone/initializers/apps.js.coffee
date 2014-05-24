Testpilot.addInitializer (options) ->
  @apps = new Testpilot.Collections.AppsCollection()
  view = new Testpilot.Views.Apps.ListView(collection: @apps)
  @apps.fetch
    success: =>
      Testpilot.navigation.show(view)