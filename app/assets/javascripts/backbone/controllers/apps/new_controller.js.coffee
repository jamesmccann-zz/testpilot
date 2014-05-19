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
      success: (app, response) =>
        @trigger 'save', @app
        Testpilot.vent.trigger 'alert', 'success', "#{@app.attributes.name} was created"
        @close()
      error: (app, response) =>
        Testpilot.vent.trigger 'alert', 'info', 'Oops, something went wrong. Please try again'
        @close()

  close: ->
    new Testpilot.Controllers.Apps.ListController

