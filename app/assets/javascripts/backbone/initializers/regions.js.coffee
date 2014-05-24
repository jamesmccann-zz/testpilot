Testpilot.addInitializer (options) ->
  Testpilot.addRegions(
    main: '#main',
    modal: Testpilot.Regions.ModalRegion,
    alert: '#header-alert',
    navigation: '#navigation'
  )
