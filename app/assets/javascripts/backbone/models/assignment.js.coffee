@Aldrin.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Assignment extends Backbone.Model
    paramRoot: 'assignment'
    defaults: {}

    initialize: (options) ->
      @app_id = options.app_id

  class Entities.AssignmentsCollection extends Backbone.Collection
    model: Entities.Assignment
    url: -> "api/apps/#{@app_id}/assignments"

    initialize: (options) ->
      @app_id = options.app_id

  App.reqres.setHandler "entities:app:assignments", (app_id) ->
    defer = $.Deferred()
    assignments = new Entities.AssignmentsCollection(app_id: app_id)
    assignments.fetch
      success: ->
        defer.resolve(assignments)
    defer.promise()

