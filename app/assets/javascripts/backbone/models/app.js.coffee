class Testpilot.Models.App extends Backbone.Model
  urlRoot: 'api/apps'
  paramRoot: 'app'
  defaults: {}

class Testpilot.Collections.AppsCollection extends Backbone.Collection
  model: Testpilot.Models.App
  url: '/api/apps'
