Testpilot.Views.Apps ||= {}

class Testpilot.Views.Apps.ShowView extends Backbone.View
  template: JST["backbone/templates/apps/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
