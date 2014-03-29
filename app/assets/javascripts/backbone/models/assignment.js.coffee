class Testpilot.Models.Assignment extends Backbone.Model
  url: -> "api/apps/#{@app_id}/assignments/#{@id}"
  paramRoot: 'assignment'
  defaults: {}

  initialize: (options) ->
    @app_id = options.app_id

class Testpilot.Collections.AssignmentsCollection extends Backbone.Collection
  model: Testpilot.Models.Assignment
  url: -> "api/apps/#{@app_id}/assignments"

  initialize: (options) ->
    @app_id = options.app_id
