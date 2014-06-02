#= require_tree ./config
#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./regions
#= require_tree ./views
#= require_tree ./controllers
#= require_tree ./routers
#= require_tree ./helpers

@Aldrin = do (Backbone, Marionette) ->

  App = new Marionette.Application()

  App.addRegions
    main:    '#main-region'
    sidebar: '#sidebar-region'
    modal:   Aldrin.Regions.ModalRegion

  App.addInitializer (options) ->
    @currentUser = new Testpilot.Models.User
    @currentUser.fetch()

  App.addInitializer
    App.module('Sidebar').start()

  App.on 'initialize:after', (options) ->
    Backbone.history.start()

  App

