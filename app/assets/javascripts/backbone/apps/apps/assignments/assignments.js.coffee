@Aldrin.module 'Apps.Assignments', (Assignments, App, Backbone, Marionette, $, _) ->

  API =
    list: (app, region) ->
      new Assignments.List.Controller(app: app, region: region)

    new: (app, assignments, region) ->
      new Assignments.New.Controller(app: app, assignments: assignments, region: region)

  App.commands.setHandler 'app:assignments:list', (app, region) ->
    API.list(app, region)

  App.commands.setHandler 'app:assignments:new', (app, assignments, region) ->
    API.new(app, assignments, region)
