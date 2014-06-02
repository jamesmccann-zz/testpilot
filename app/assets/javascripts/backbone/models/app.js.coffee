@Aldrin.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.App extends Backbone.Model
    urlRoot: 'api/apps'
    paramRoot: 'app'
    defaults: {}

  class Entities.AppsCollection extends Backbone.Collection
    model: Entities.App
    url: '/api/apps'

  App.reqres.setHandler "entities:apps", ->
    defer = $.Deferred()
    apps = new Entities.AppsCollection
    apps.fetch
      success: ->
        defer.resolve(apps)
    defer.promise()

  App.reqres.setHandler "entities:app", (id) ->
    defer = $.Deferred()
    app = new Entities.App(id: id)
    app.fetch
      success: ->
        defer.resolve(app)
    defer.promise()

