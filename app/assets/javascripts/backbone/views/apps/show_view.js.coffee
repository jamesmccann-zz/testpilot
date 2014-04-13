Testpilot.Views.Apps ||= {}

class Testpilot.Views.Apps.ShowView extends Backbone.Marionette.CompositeView
  template: 'apps/show'
  getItemView: -> Testpilot.Views.Builds.ListItem,
  itemViewContainer: '#builds-list'
  triggers:
    'click .js-manage-assignments': 'show:assignments:clicked'

