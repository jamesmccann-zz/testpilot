Testpilot.Views.Assignment ||= {}

class Testpilot.Views.Assignments.ListView extends Backbone.Marionette.CompositeView
  template: 'assignments/list'
  className: 'modal-dialog'
  itemViewContainer: '#assignments-list'
  getEmptyView: -> Testpilot.Views.Assignments.EmptyCollection
  getItemView: -> Testpilot.Views.Assignments.ListItem
  itemViewOptions: ->
    {collection: this.collection}
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

  constructor: ->
    super
    @model = @collection.models.filter((assignment) ->
      assignment.attributes.user.id == Testpilot.currentUser.get('id')
    )[0]



  events:
    'submit form#new_assignment': 'addAssignment'

