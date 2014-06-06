@Aldrin.module 'Apps.Builds.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base

    initialize: (options) ->
      buildsRequest = App.request "entities:app:builds", options.app_id
      buildsRequest.done (builds) =>
        showListView.call(this, builds)

    showListView = (builds) ->
      console.log "showing builds list"
      console.log builds
      @region.show new List.BuildsList(collection: builds)

