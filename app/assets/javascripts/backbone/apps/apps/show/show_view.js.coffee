@Aldrin.module 'Apps.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Layout extends Marionette.Layout
    template: 'apps/show/layout'
    regions:
      controls: '#app-controls-region'
      description: '#app-description-region'
      builds: '#app-builds-region'
      current_build: '#app-current-build-region'
    templateHelpers:
      hasCurrentBuild: ->
        this.latest_build
      currentBuildNumber: ->
        this.latest_build.number

  class Show.Description extends Marionette.ItemView
    template: 'apps/show/description'

