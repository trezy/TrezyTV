define [
  'marionette'
  'v/Nav'
  'hbs!tpl/root'
], (
  Marionette
  NavView
  rootTemplate
) ->
  class Root extends Backbone.Marionette.LayoutView
    tagName: 'body'

    template: rootTemplate

    regions:
      header: 'header'
      main: 'main'
      nav: 'nav'

    initialize: ->
      console.log @nav
      @nav.show new NavView
