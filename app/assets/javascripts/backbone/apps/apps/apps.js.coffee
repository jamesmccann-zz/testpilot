@Aldrin.module 'Apps', (Apps, App, Backbone, Marionette, $, _) ->

  class Apps.Router extends Marionette.AppRouter
    appRoutes:
      'apps/:id' : 'show'

  API =
    show: (id) ->
      Apps.Show.Controller.show id

  App.addInitializer ->
    new Apps.Router
      controller: API



