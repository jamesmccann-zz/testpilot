Testpilot.Views.Apps ||= {}

class Testpilot.Views.Apps.ListItem extends Backbone.Marionette.ItemView
  tagName: 'li'
  template: 'apps/list_item'
  className: 'app-list-item'
