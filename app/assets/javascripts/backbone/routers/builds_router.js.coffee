class Testpilot.Routers.BuildsRouter extends Backbone.Marionette.AppRouter
  routes:
    ":app_id/builds"       : "index"
    ":app_id/builds/:id"   : "show"
    ":app_id/builds/.*"    : "index"

  index: (app_id) ->
    @builds = new Testpilot.Collections.BuildsCollection(app_id: app_id)
    @builds.fetch
      success: =>
        @view = new Testpilot.Views.Builds.ListView(collection: @builds)
        $("#testpilot").html(@view.render().el)

  show: (app_id, id) ->
    build = new Testpilot.Models.Build(app_id: app_id, id: id)
    build.fetch
      success: =>
        @view = new Testpilot.Views.Builds.ShowView(model: build)
        $("#testpilot").html(@view.render().el)



