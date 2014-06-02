@Aldrin.module 'Sidebar.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Empty extends Marionette.Views.ItemView
    template: 'sidebar/empty_item'

  class Show.App extends Marionette.Views.ItemView
    tagName: 'li'
    template: 'sidebar/app_item'

  class Show.AppsList extends Marionette.Views.CompositeView
    template: 'sidebar/apps_list'
    itemView: Show.App
    itemViewContainer: '#apps-list'
    #emptyView: Show.Empty

