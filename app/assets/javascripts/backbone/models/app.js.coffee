class Testpilot.Models.App extends Backbone.Model
  paramRoot: 'app'

  defaults:

class Testpilot.Collections.AppsCollection extends Backbone.Collection
  model: Testpilot.Models.App
  url: '/api/apps'
