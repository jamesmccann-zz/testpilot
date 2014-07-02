@Aldrin.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.User extends Backbone.Model
    paramRoot: 'user'
    url: -> '/api/user'
    defaults: {}
