Testpilot.Views.Builds ||= {}

class Testpilot.Views.Builds.ListItem extends Backbone.Marionette.ItemView
  tagName: 'tr'
  template: 'builds/list_item'
  templateHelpers: ->
    downloadBuild: =>
      window.open(@model.attributes.url)
