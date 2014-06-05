#= require_tree ./config
#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./apps

@Aldrin = do (Backbone, Marionette) ->

  App = new Marionette.Application()

  App.addRegions
    main:    'section.main'
    sidebar: 'aside.main'

  App.addInitializer (options) ->
    @currentUser = new Aldrin.Entities.User
    @currentUser.fetch()

  App.addInitializer (options) ->
    App.module('Sidebar').start()

  App.on 'initialize:after', (options) ->
    Backbone.history.start()

  App

