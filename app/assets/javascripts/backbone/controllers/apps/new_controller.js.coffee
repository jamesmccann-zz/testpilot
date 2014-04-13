Testpilot.Controllers.Apps ||= {}

class Testpilot.Controllers.Apps.NewController extends Backbone.Marionette.Controller

  initialize: ->
    @app = new Testpilot.Models.App
    @view = new Testpilot.Views.Apps.Form(model: @app)
    Testpilot.main.show(@view)

    @listenTo @view, "form:submit", (child, args) -> @createApp()
    @listenTo @view, "form:cancel", (child, args) -> @close()

  createApp: ->
    @view.update()
    @app.save {},
      success: =>
        @trigger 'save', @app
        @close()

  close: ->
    new Testpilot.Controllers.Apps.ListController



