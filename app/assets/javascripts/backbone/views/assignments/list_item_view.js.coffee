Testpilot.Views.Assignments ||= {}

class Testpilot.Views.Assignments.ListItem extends Backbone.Marionette.ItemView
  tagName: 'div'
  className: 'row assignment-row'
  template: 'assignments/list_item'
  destroyAssignment: ->
    this.model.destroy()
  events:
    'click .js-remove-assignment': 'destroyAssignment'

