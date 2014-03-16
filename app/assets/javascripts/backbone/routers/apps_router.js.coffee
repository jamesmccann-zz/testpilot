class Testpilot.Routers.AppsRouter extends Backbone.Marionette.AppRouter
  routes:
    ''         : 'root'
    "index"    : "index"
    ":id"      : "show"
    ".*"       : "index"

  root: ->
    @apps = new Testpilot.Collections.AppsCollection()
    @apps.fetch(reset: true)

  index: ->
    @view = new Testpilot.Views.Apps.IndexView(apps: @apps)
    $("#apps").html(@view.render().el)

  show: (id) ->
    app = @apps.get(id)

    @view = new Testpilot.Views.Apps.ShowView(model: app)
    $("#apps").html(@view.render().el)

