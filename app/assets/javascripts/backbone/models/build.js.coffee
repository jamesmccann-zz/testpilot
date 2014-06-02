@Aldrin.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Build extends Backbone.Model
    url: -> "api/apps/#{@app_id}/builds/#{@id}"
    paramRoot: 'build'
    defaults: {}

    initialize: (options) ->
      @app_id = options.app_id

  class Entities.BuildsCollection extends Backbone.Collection
    model: Entities.Build
    url: -> "api/apps/#{@app_id}/builds"

    initialize: (options) ->
      @app_id = options.app_id
