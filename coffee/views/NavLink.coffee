define [
  'marionette'
  'hbs!tpl/navLink'
], (
  Marionette
  navLinkTemplate
) ->
  class NavLink extends Backbone.Marionette.ItemView
    template: =>
      navLinkTemplate @model.attributes

    tagName: 'li'
