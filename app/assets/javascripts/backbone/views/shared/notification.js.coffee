Testpilot.Views.Shared ||= {}

class Testpilot.Views.Shared.NotificationView extends Backbone.Marionette.ItemView
  DISMISS_DELAY = 5000

  template: 'shared/notification'

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

