class Testpilot.Routers.AppsRouter extends Backbone.Marionette.AppRouter
  routes:
    "index"      : "index"
    ":id"        : "show"
    ".*"         : "index"

  index: ->
    @apps = new Testpilot.Collections.AppsCollection()
    @apps.fetch
      success: =>
        @view = new Testpilot.Views.Apps.ListView(collection: @apps)
        Testpilot.main.show(@view)

  show: (id) ->
    app = new Testpilot.Models.App(id: id)
    app.fetch
      success: =>
        @view = new Testpilot.Views.Apps.ShowView(model: app)
        Testpilot.main.show(@view)


