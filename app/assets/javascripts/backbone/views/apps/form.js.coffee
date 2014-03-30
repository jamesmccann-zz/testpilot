Testpilot.Views.Apps ||= {}

class Testpilot.Views.Apps.Form extends Backbone.Marionette.ItemView
  template: 'apps/form'
  className: 'modal-dialog'

  events:
    'submit form#new-app': 'create'
    'click .js-cancel': 'close'

  ui:
    name: "input[name='app[name]']"

  update: ->
    data =
      name: @ui.name.val()

    @model.set(data)

  create: (evt) ->
    evt.preventDefault()
    @update()
    @model.save {},
      success: =>
        @trigger 'save', @model
        @close()

