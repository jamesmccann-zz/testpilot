Testpilot.Views.Builds ||= {}

class Testpilot.Views.Builds.ListItem extends Backbone.Marionette.ItemView
  tagName: 'tr'
  template: 'builds/list_item'

  events:
    'click button.download-apk': 'downloadApk'

  downloadApk: ->
    window.open(@model.attributes.url)

