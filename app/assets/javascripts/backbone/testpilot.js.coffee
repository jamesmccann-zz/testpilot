#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers
#= require_tree ./initializers

@Testpilot = new Marionette.Application()

Backbone.Marionette.Renderer.render = (template, data) ->
  JST["backbone/templates/#{template}"](data)

@Testpilot.Models = {}
@Testpilot.Collections = {}
@Testpilot.Routers = {}
@Testpilot.Views = {}
