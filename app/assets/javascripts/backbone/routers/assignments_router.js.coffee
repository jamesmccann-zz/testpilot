class Testpilot.Routers.AssignmentsRouter extends Backbone.Marionette.AppRouter
  routes:
    "apps/:app_id/assignments"       : "index"
    "apps/:app_id/assignments/.*"    : "index"

  index: (app_id) ->
    @assignment = new Testpilot.Collections.AssignmentsCollection(app_id: app_id)
    @assignment.fetch
      success: =>
        @view = new Testpilot.Views.Assignments.ListView(collection: @assignment)
        $("#testpilot").html(@view.render().el)

