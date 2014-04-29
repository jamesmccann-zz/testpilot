Testpilot.vent.on 'alert', (cls, message) ->
  Testpilot.notification.show(
    new Testpilot.Views.Shared.NotificationView(cls, message)
  )
