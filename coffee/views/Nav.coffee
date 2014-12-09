define [
  'marionette'
  'v/NavLink'
  'hbs!tpl/nav'
  'hbs!tpl/navLink'
], (
  Marionette
  NavLinkView
  navTemplate
  navLinkTemplate
) ->
  class Nav extends Backbone.Marionette.CompositeView
    template: navTemplate

    tagName: 'nav'

    childView: NavLinkView

    childViewContainer: 'ul'

    collection: new Backbone.Collection [
      {
        url: '/pricing'
        name: 'Pricing'
        icon: ''
      }, {
        url: '/schedule'
        name: 'Schedule'
        icon: ''
      }, {
        url: '/contact'
        name: 'Contact'
        icon: ''
      }#, {
      #  url: '/about'
      #  name: 'About'
      #  icon: ''
      #}
    ]
