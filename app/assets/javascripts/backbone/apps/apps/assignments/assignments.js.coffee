@Aldrin.module 'Apps.Assignments', (Assignments, App, Backbone, Marionette, $, _) ->

  API =
    list: (app_id, region) ->
      new Assignments.List.Controller(app_id: app_id, region: region)

  App.commands.setHandler 'app:assignments:list', (app, region) ->
    API.list(app.get('id'), region)

