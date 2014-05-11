#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./regions
#= require_tree ./views
#= require_tree ./controllers
#= require_tree ./routers
#= require_tree ./initializers
#= require_tree ./helpers

@Testpilot = new Marionette.Application()

Backbone.Marionette.Renderer.render = (template, data) ->
  JST["backbone/templates/#{template}"](data)

@Testpilot.Models = {}
@Testpilot.Collections = {}
@Testpilot.Routers = {}
@Testpilot.Views = {}
@Testpilot.Controllers = {}
@Testpilot.Regions = {}
