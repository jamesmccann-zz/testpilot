Testpilot.Views.Builds ||= {}

class Testpilot.Views.Builds.ListView extends Backbone.Marionette.CompositeView
  template: 'builds/list'
  getItemView: -> Testpilot.Views.Builds.ListItem
  itemViewContainer: 'tbody'

