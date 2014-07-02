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

  App.reqres.setHandler 'entities:app:builds', (app_id) ->
    defer = $.Deferred()
    builds = new Entities.BuildsCollection(app_id: app_id)
    builds.fetch
      success: ->
        defer.resolve(builds)
    defer.promise()

  App.reqres.setHandler 'entities:app:build', (app_id, id) ->
    defer = $.Deferred()
    build = new Entities.Build(app_id: app_id, id: id)
    build.fetch
      success: ->
        defer.resolve(build)
    defer.promise()
