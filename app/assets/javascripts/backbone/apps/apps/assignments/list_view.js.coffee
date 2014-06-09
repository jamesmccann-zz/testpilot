@Aldrin.module 'Apps.Assignments.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Empty extends Marionette.ItemView
    template: 'apps/assignments/empty_item'

  class List.Assignment extends Marionette.ItemView
    template: 'apps/assignments/assignment_item'

  class List.AssignmentsList extends Marionette.CompositeView
    template: 'apps/assignments/list'
    itemViewContainer: '.assignments-list'
    itemView: List.Assignment
    emptyView: List.Empty


