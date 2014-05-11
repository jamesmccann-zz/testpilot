Testpilot.Views.Shared ||= {}

class Testpilot.Views.Shared.AlertView extends Backbone.Marionette.ItemView
  DISMISS_DELAY = 5000

  template: 'shared/alert'

  constructor: (@cls, @message) ->
    super()
    setTimeout(=>
      @close()
    , DISMISS_DELAY)

  serializeData: ->
    {
      cls: @cls
      message: @message
    }

