@Aldrin.module 'Apps.Assignments.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base

    initialize: (options) ->
      request = App.request "entities:app:assignments", options.app_id
      request.done (@assignments) =>
        showListView.call(this)

    showListView = ->
      @region.show new List.AssignmentsList(collection: @assignments)


