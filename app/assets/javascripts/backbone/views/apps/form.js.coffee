Testpilot.Views.Apps ||= {}

class Testpilot.Views.Apps.Form extends Backbone.Marionette.ItemView
  template: 'apps/form'

  triggers:
    'submit': 'form:submit'
    "click [data-form-button='cancel']": 'form:cancel'

  ui:
    name: "input[name='app[name]']"

  update: ->
    data =
      name: @ui.name.val()

    @model.set(data)

