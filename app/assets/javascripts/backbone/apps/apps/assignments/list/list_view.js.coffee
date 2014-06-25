@Aldrin.module 'Apps.Assignments.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends Marionette.LayoutView
    template: 'apps/assignments/list/layout'
    regions:
      list: '#assignments-list-region'
      form: '#assignments-form-region'

  class List.Empty extends Marionette.ItemView
    template: 'apps/assignments/list/empty_item'

  class List.Assignment extends Marionette.ItemView
    template: 'apps/assignments/list/assignment_item'
    triggers:
      'click .js-remove-assignment': 'assignment:destroy'

  class List.AssignmentsList extends Marionette.CollectionView
    childViewContainer: '.assignments-list'
    childView: List.Assignment
    emptyView: List.Empty


