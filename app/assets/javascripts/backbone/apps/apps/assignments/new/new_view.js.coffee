@Aldrin.module 'Apps.Assignments.New', (New, App, Backbone, Marionette, $, _) ->

  class New.Form extends Marionette.ItemView
    template: 'apps/assignments/new/form'

    events:
      'submit form': 'formSubmitted'

    ui:
      form: 'form#new-assignment'
      email: 'input[name=email]'
      developer: 'input[name=developer]'

    formSubmitted: (evt) ->
      evt.preventDefault()
      data = Backbone.Syphon.serialize(this)
      @model.set(data)
      @trigger 'form:submitted', @model

    onSubmitSuccess: ->
      @ui.form[0].reset()

    onSubmitFailure: (response) ->
      #TODO: error UI
      console.log 'error'


