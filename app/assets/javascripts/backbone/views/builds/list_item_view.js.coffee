Testpilot.Views.Builds ||= {}

class Testpilot.Views.Builds.ListItem extends Backbone.Marionette.ItemView
  tagName: 'div'
  template: 'builds/list_item'
  className: 'list-item-row pam'

  events:
    'click button.download-apk': 'downloadApk'

  downloadApk: ->
    if typeof Android == "undefined"
      window.open(@model.attributes.url)
    else
      Android.downloadApk(@model.attributes.url)

