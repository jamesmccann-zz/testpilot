Testpilot.Views.Assignment ||= {}

class Testpilot.Views.Assignments.ListView extends Backbone.Marionette.CompositeView
  template: 'assignments/list'
  getItemView: -> Testpilot.Views.Assignments.ListItem
  itemViewContainer: '#assignments-list'

