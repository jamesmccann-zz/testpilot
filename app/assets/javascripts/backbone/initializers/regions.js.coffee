Testpilot.addInitializer (options) ->
  Testpilot.addRegions(
    main: '#testpilot',
    modal: Testpilot.Regions.ModalRegion,
    alert: '#header-alert'
  )
