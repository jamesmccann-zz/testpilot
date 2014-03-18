class Testpilot.Routers.AppRouter extends Backbone.Marionette.AppRouter
  routes:
    "index"    : "index"
    ":id"      : "show"
    ".*"       : "index"

  index: ->
    @apps = new Testpilot.Collections.AppsCollection()
    @apps.fetch
      success: =>
        @view = new Testpilot.Views.Apps.ListView(collection: @apps)
        $("#apps").html(@view.render().el)

  show: (id) ->
    app = new Testpilot.Models.App(id: id)
    app.fetch
      success: =>
        @view = new Testpilot.Views.Apps.ShowView(model: app)
        $("#apps").html(@view.render().el)

