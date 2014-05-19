Testpilot.vent.on 'alert', (cls, message) ->
  Testpilot.alert.show(
    new Testpilot.Views.Shared.AlertView(cls, message)
  )
