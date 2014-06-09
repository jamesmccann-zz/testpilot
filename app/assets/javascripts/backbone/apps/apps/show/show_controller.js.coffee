@Aldrin.module 'Apps.Show', (Show, App, Backbone, Marionette, $, _) ->

  Show.Controller =

    show: (id) ->
      appRequest = App.request "entities:app", id
      @layout = new Show.Layout

      appRequest.done (@app) =>
        @layout.model = @app
        App.main.show @layout
        showCurrentBuild.call(this)

      @layout.on 'show', =>
        showDescriptionView.call(this)
        showBuildsList.call(this)

  showControlsView = ->
    @layout.controls.show new Show.Controls(model: @app)

  showDescriptionView = ->
    @layout.description.show new Show.Description(model: @app)

  showCurrentBuild = ->
    if @app.get('latest_build')
      App.execute 'app:builds:show', @app, @app.get('latest_build').id, @layout.current_build

  showBuildsList = ->
    App.execute 'app:builds:list', @app, @layout.builds
