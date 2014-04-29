class Testpilot.Routers.AppsRouter extends Backbone.Marionette.AppRouter
  routes:
    "index"      : "index"
    ":id"        : "show"
    "apps/new"   : "new"
    ".*"         : "index"

  index: ->
    new Testpilot.Controllers.Apps.ListController

  show: (id) ->
    new Testpilot.Controllers.Apps.ShowController(id)

  new: ->
    new Testpilot.Controllers.Apps.NewController

  Testpilot.vent.on 'apps:new', ->
    new Testpilot.Controllers.Apps.NewController



