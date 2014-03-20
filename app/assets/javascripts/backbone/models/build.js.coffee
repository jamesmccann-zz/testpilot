class Testpilot.Models.Build extends Backbone.Model
  url: -> "api/apps/#{@app_id}/builds/#{@id}"
  paramRoot: 'build'
  defaults: {}

  initialize: (options) ->
    @app_id = options.app_id

class Testpilot.Collections.BuildsCollection extends Backbone.Collection
  model: Testpilot.Models.Build
  url: -> "api/apps/#{@app_id}/builds"

  initialize: (options) ->
    @app_id = options.app_id
