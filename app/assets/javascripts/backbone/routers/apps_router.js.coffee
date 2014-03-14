class Testpilot.Routers.AppsRouter extends Backbone.Router
  initialize: (options) ->
    @apps = new Testpilot.Collections.AppsCollection()
    @apps.fetch(reset: true)

  routes:
    "index"    : "index"
    ":id"      : "show"
    ".*"        : "index"

  index: ->
    @view = new Testpilot.Views.Apps.IndexView(apps: @apps)
    $("#apps").html(@view.render().el)

  show: (id) ->
    app = @apps.get(id)

    @view = new Testpilot.Views.Apps.ShowView(model: app)
    $("#apps").html(@view.render().el)

