define [
  'marionette'
  'ctrl/Core'
], (
  Marionette
  CoreController
) ->
  class Router extends Backbone.Marionette.AppRouter
    appRoutes:
      '(home)(/)': 'home'
      'about(/)': 'about'
      'contact(/)': 'contact'
      'pricing(/)': 'pricing'
      'schedule(/)': 'schedule'

    controller: new CoreController
