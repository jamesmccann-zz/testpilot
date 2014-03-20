Testpilot.Views.Apps ||= {}

class Testpilot.Views.Apps.ListItem extends Backbone.Marionette.ItemView
  tagName: 'div'
  template: 'apps/list_item'
  className: 'list-item-row pam'
