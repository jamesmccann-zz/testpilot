@Aldrin.module 'Apps.Show', (Show, App, Backbone, Marionette, $, _) ->

  Show.Controller =

    show: (id) ->
      appRequest = App.request "entities:app", id
      appRequest.done (app) =>
        showDescriptionView.call(this, app)
        showBuildsList.call(this, app)

      @layout = new Show.Layout
      App.main.show @layout

  showDescriptionView = (app) ->
    @layout.description.show new Show.Description({model: app})

  showBuildsList = (app) ->
    App.execute 'app:builds:list', app, @layout.builds
