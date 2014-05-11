Testpilot.Views.Apps ||= {}

class Testpilot.Views.Apps.ListView extends Backbone.Marionette.CompositeView
  template: 'apps/list'
  getItemView: -> Testpilot.Views.Apps.ListItem
  itemViewContainer: '#apps-list'
  events:
    'click .js-new-app': -> Testpilot.vent.trigger 'new:app'

