@Aldrin.module 'Sidebar', (Sidebar, App, Backbone, Marionette, $, _) ->

  API =
    show: ->
      Sidebar.Show.Controller.show()

  Sidebar.on 'start', ->
    API.show()

