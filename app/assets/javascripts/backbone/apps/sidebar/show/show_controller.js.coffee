@Aldrin.module 'Sidebar.Show', (Show, App, Backbone, Marionette, $, _) ->

  Show.Controller =

    show: ->
      appsRequest = App.request "entities:apps"
      appsRequest.done (apps) =>
        showAppsView.call(this, apps)

      @layout = new Show.Layout

      @layout.on 'show', =>
        showLoadingView.call(this)

      App.sidebar.show @layout

  showLoadingView = ->
    @layout.appsRegion.show new Show.Loading

  showAppsView = (@apps) ->
    @layout.appsRegion.show new Show.AppsList(collection: @apps)
