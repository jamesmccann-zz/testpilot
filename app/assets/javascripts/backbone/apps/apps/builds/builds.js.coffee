@Aldrin.module 'Apps.Builds', (Builds, App, Backbone, Marionette, $, _) ->

  class Builds.Router extends Marionette.AppRouter
    appRoutes:
      'apps/:id/builds' : 'list'

  API =
    list: (app_id, region) ->
      new Builds.List.Controller(app_id: app_id, region: region)

  App.commands.setHandler 'app:builds:list', (app, region) ->
    API.list(app.id, region)


