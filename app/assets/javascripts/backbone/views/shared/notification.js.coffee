Testpilot.Views.Shared ||= {}

class Testpilot.Views.Shared.NotificationView extends Backbone.Marionette.ItemView
  template: 'shared/notification'

  constructor: (@cls, @message) ->
    super()

  serializeData: ->
    {
      cls: @cls
      message: @message
    }

