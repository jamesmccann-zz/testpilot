@Aldrin.module 'Apps.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Layout extends Marionette.Layout
    template: 'apps/show/layout'
    regions:
      description: '#app-description-region'
      builds: '#app-builds-region'

  class Show.Description extends Marionette.ItemView
    template: 'apps/show/description'

