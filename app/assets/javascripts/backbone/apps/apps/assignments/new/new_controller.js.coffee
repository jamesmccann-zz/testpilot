@Aldrin.module 'Apps.Assignments.New', (New, App, Backbone, Marionette, $, _) ->

  class New.Controller extends App.Controllers.Base

    initialize: (options) ->
      @assignments = options.assignments
      @assignment = new @assignments.model

      formView = new New.Form(model: @assignment)
      @listenTo formView, 'form:submitted', =>
        @assignments.create(
          @assignment.attributes,
          wait: true,
          success: =>
            formView.onSubmitSuccess()
          error: (assignment, response) =>
            formView.onSubmitFailure(response)
        )

      @region.show formView



