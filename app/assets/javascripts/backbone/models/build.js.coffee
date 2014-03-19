class Testpilot.Models.Build extends Backbone.Model
  paramRoot: 'build'
  defaults: {}

  downloadApk: (options) ->
    Backbone.sync.call this, null, this, _.extend(
      url: @url() + "/download"
      type: 'GET'
    , options)

class Testpilot.Collections.BuildsCollection extends Backbone.Collection
  model: Testpilot.Models.Build
  url: '/api/builds'
