class Testpilot.Routers.BaseRouter extends Backbone.Marionette.AppRouter
  routes:
    "index" : "root"
    ".*"    : "root"

  root: ->
    new Testpilot.Controllers.Apps.ListController
