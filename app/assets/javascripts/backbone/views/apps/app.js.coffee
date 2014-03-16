Testpilot.Views.Apps ||= {}

class Testpilot.Views.Apps.AppView extends Backbone.View
  template: JST["backbone/templates/apps/app"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
