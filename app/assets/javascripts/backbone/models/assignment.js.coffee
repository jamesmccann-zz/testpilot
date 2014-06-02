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
