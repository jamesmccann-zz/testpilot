@Aldrin.module 'Apps.Assignments.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base

    initialize: (options) ->
      @app = options.app

      @layout = new List.Layout
      @layout.on 'show', =>
        showListView.call(this)
        showFormView.call(this)

      request = App.request "entities:app:assignments", @app.get('id')
      request.done (@assignments) =>
        @region.show @layout

      App.vent.on 'assignment:created', (assignment) ->
        @assignments.add(assignment)

    showListView = ->
      listView = new List.AssignmentsList(collection: @assignments)

      @listenTo listView, 'itemview:assignment:destroy', (item, args) ->
        debugger
        args.model.destroy()

      @layout.list.show listView

    showFormView = ->
      App.execute 'app:assignments:new', @app, @assignments, @layout.form


