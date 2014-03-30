Testpilot.Views.Apps ||= {}

class Testpilot.Views.Apps.ShowView extends Backbone.Marionette.CompositeView
  template: 'apps/show'
  getItemView: -> Testpilot.Views.Builds.ListItem,
  itemViewContainer: 'ul'
  initialize: ->
    $('#testpilot').html(this.render().el)
    builds = new Testpilot.Collections.BuildsCollection(app_id: @model.id)
    builds.fetch
      success: =>
        @collection = builds
        Testpilot.main.show(this)
        $('.loading-indicator').remove()
