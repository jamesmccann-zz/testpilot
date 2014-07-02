@Aldrin.module 'Controllers', (Controllers, App, Backbone, Marionette, $, _) ->
 class Controllers.Base extends Marionette.Controller

   constructor: (options = {}) ->
     @region = options.region
     super(options)
