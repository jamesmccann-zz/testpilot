Testpilot.Views.Apps ||= {}

class Testpilot.Views.Apps.ListView extends Backbone.Marionette.CompositeView
  template: 'apps/list'
  getItemView: -> Testpilot.Views.Apps.ListItem
  itemViewContainer: '#apps-list'
  events:
    'click .js-new-app': 'showAppForm'

  showAppForm: ->
    app = new Testpilot.Models.App()
    Testpilot.modal.show(
      new Testpilot.Views.Apps.Form(model: app)
    )

