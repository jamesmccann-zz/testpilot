Testpilot.Views.Apps ||= {}

class Testpilot.Views.Apps.ShowView extends Backbone.Marionette.CompositeView
  template: 'apps/show'
  getItemView: -> Testpilot.Views.Builds.ListItem,
  itemViewContainer: 'ul'
  events:
    'click .js-manage-assignments': 'showAssignments'

  showAssignments: ->
    @assignments = new Testpilot.Collections.AssignmentsCollection(app_id: @model.id)
    @assignments.fetch
      success: =>
        Testpilot.modal.show(
          new Testpilot.Views.Assignments.ListView(collection: @assignments)
        )

  initialize: ->
    builds = new Testpilot.Collections.BuildsCollection(app_id: @model.id)
    builds.fetch
      success: =>
        @collection = builds
        Testpilot.main.show(this)
        $('.loading-indicator').remove()
