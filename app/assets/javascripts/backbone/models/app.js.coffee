@Aldrin.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.App extends Backbone.Model
    urlRoot: 'api/apps'
    paramRoot: 'app'
    defaults: {}

  class Entities.AppsCollection extends Backbone.Collection
    model: Entities.App
    url: '/api/apps'
