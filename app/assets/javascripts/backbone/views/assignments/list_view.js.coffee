Testpilot.Views.Assignments ||= {}

class Testpilot.Views.Assignments.ListView extends Backbone.Marionette.CompositeView
  template: 'assignments/list'
  className: 'modal-dialog'
  itemViewContainer: '#assignments-list'
  getEmptyView: -> Testpilot.Views.Assignments.EmptyCollection
  getItemView: -> Testpilot.Views.Assignments.ListItem
  itemViewOptions: ->
    {collection: this.collection}

  events:
    'submit form#new_assignment': 'addAssignment'

  addAssignment: (evt) ->
    evt.preventDefault()
    form = $(evt.target)
    this.collection.create(
      form.serializeJSON().assignment,
      wait: true,
      success: =>
        form.get(0).reset()
      error: =>
        $('.form-group', form).addClass('has-error')
    )

