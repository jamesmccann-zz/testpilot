Testpilot.Controllers.Apps ||= {}

class Testpilot.Controllers.Apps.ShowController extends Backbone.Marionette.Controller

  initialize: (id) ->
    @app = new Testpilot.Models.App(id: id)
    @view = new Testpilot.Views.Apps.ShowView
    @app.fetch
      success: =>
        @view.model = @app
        Testpilot.main.show(@view)

    @listenTo @view, 'show:assignments:clicked', (child, args) ->
      @showAssignments()

    #TODO: move to a subview
    builds = new Testpilot.Collections.BuildsCollection(app_id: @app.id)
    builds.fetch
      success: =>
        @view.collection = builds
        Testpilot.main.show(@view)
        $('.loading-indicator').remove()


  showAssignments: ->
    assignments = new Testpilot.Collections.AssignmentsCollection(app_id: @app.id)
    assignments.fetch
      success: =>
        Testpilot.modal.show(
          new Testpilot.Views.Assignments.ListView(collection: assignments)
        )



