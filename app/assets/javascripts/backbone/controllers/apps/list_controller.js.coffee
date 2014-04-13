Testpilot.Controllers.Apps ||= {}

class Testpilot.Controllers.Apps.ListController extends Backbone.Marionette.Controller

  initialize: ->
    apps = new Testpilot.Collections.AppsCollection()
    view = new Testpilot.Views.Apps.ListView(collection: apps)
    apps.fetch
      success: =>
        Testpilot.main.show(view)

