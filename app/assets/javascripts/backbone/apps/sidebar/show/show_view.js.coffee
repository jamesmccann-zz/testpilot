@Aldrin.module 'Sidebar.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Layout extends Marionette.Layout
    template: 'sidebar/layout'
    regions:
      appsRegion: '#apps-region'

  class Show.Empty extends Marionette.ItemView
    template: 'sidebar/empty_item'

  class Show.App extends Marionette.ItemView
    tagName: 'li'
    template: 'sidebar/app_item'

  class Show.AppsList extends Marionette.CompositeView
    template: 'sidebar/apps_list'
    itemView: Show.App
    itemViewContainer: '#apps-list'
    emptyView: Show.Empty

