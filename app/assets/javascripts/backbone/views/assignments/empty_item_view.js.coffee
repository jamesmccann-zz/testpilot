Testpilot.Views.Assignments ||= {}

class Testpilot.Views.Assignments.EmptyCollection extends Backbone.Marionette.ItemView
  tagName: 'div'
  template: 'assignments/empty_collection'
  events:
    'click .js-refresh': ->
      $('.close', this.el).addClass('fa-spin')
      this.options.collection.fetch()
