@Aldrin.module 'Apps.Show', (Show, App, Backbone, Marionette, $, _) ->

  Show.Controller =

    show: (id) ->
      appRequest = App.request "entities:app", id
      appRequest.done (app) =>
        showControlsView.call(this, app)
        showDescriptionView.call(this, app)
        showBuildsList.call(this, app)
        showCurrentBuild.call(this, app)

      @layout = new Show.Layout
      App.main.show @layout

  showControlsView = (app) ->
    @layout.controls.show new Show.Controls(model: app)

  showDescriptionView = (app) ->
    @layout.description.show new Show.Description(model: app)

  showCurrentBuild = (app) ->
    App.execute 'app:builds:show', app, app.get('latest_build').id, @layout.current_build

  showBuildsList = (app) ->
    App.execute 'app:builds:list', app, @layout.builds
