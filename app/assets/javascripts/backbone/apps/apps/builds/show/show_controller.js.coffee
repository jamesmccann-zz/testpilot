@Aldrin.module 'Apps.Builds.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Base

    initialize: (options) ->
      buildsRequest = App.request "entities:app:build", options.app_id, options.id
      buildsRequest.done (build) =>
        showBuildView.call(this, build)

    showBuildView = (build) ->
      @region.show new Show.Build(model: build)

