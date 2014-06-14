@Aldrin.module 'Apps.Assignments.New', (New, App, Backbone, Marionette, $, _) ->

  class New.Form extends Marionette.ItemView
    template: 'apps/assignments/new/form'

    events:
      'submit form': 'formSubmitted'

    formSubmitted: (evt) ->
      evt.preventDefault()
      data = Backbone.Syphon.serialize(this)
      @model.set(data)
      @trigger 'form:submitted', @model

    reset: ->
      console.log 'reset'

    error: (response) ->
      console.log 'error'


