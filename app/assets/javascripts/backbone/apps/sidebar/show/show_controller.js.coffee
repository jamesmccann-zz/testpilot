@Aldrin.module 'Sidebar.Show', (Show, App, Backbone, Marionette, $, _) ->

  Show.Controller =

    show: ->
      @layout = new Show.Layout

      @layout.on 'show', =>
        @layout.appsRegion.show new Show.AppsList

      App.sidebar.show @layout
