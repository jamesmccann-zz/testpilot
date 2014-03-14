Testpilot.Views.Apps ||= {}

class Testpilot.Views.Apps.IndexView extends Backbone.View
  template: JST["backbone/templates/apps/index"]

  initialize: () ->
    @options.apps.bind('reset', @addAll)

  addAll: () =>
    @options.apps.each(@addOne)

  addOne: (app) =>
    view = new Testpilot.Views.Apps.AppView({model : app})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(apps: @options.apps.toJSON() ))
    @addAll()

    return this
