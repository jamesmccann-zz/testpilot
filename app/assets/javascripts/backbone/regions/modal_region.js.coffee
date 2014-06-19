class Aldrin.Regions.ModalRegion extends Backbone.Marionette.Region
  el: '#modal'

  constructor: ->
    _.bindAll(this)
    super()
    @on('show', @showModal, this)

  getEl: (selector) ->
    $el = $(selector)
    $el.on 'hidden', @close

    return $el

  showModal: (view) ->
    view.on 'close', @hideModal, this
    @.$el.modal('show')

  hideModal: ->
    this.$el.modal('hide')

