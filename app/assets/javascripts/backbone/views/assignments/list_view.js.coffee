Testpilot.Views.Assignment ||= {}

class Testpilot.Views.Assignments.ListView extends Backbone.Marionette.CompositeView
  template: 'assignments/list'
  className: 'modal-dialog'
  getEmptyView: -> Testpilot.Views.Assignments.EmptyCollection
  getItemView: -> Testpilot.Views.Assignments.ListItem
  itemViewOptions: ->
    {collection: this.collection}
  itemViewContainer: '#assignments-list'

