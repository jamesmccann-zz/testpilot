Testpilot.addInitializer (options) ->
  @currentUser = new Testpilot.Models.User
  @currentUser.fetch()
