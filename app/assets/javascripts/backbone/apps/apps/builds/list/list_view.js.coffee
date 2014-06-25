@Aldrin.module 'Apps.Builds.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Empty extends Marionette.ItemView
    template: 'apps/builds/list/empty_item'

  class List.Build extends Marionette.ItemView
    template: 'apps/builds/list/build_item'

  class List.BuildsList extends Marionette.CollectionView
    childView: List.Build
    emptyView: List.Empty

