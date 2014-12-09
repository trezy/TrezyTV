define [
  'backbone.intercept'
  'marionette'
], (
  BackboneIntercept
  Marionette
) ->
  class App extends Backbone.Marionette.Application
    onStart: ->
      Backbone.history.start pushState: true
      BackboneIntercept.start()
