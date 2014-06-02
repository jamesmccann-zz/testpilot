@Aldrin.module 'Sidebar.Show', (Show, App, Backbone, Marionette, $, _) ->

  Show.Controller =

    show: ->
      App.sidebar.show new Show.AppsList
