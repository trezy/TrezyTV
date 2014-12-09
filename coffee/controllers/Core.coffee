define [
  'marionette'
  'v/About'
  'v/Contact'
  'v/Home'
  'v/Pricing'
  'v/Schedule'
], (
  Marionette
  AboutView
  ContactView
  HomeView
  PricingView
  ScheduleView
) ->
  class Core extends Backbone.Marionette.Controller
    about: ->
      app.main.show new AboutView

    contact: ->
      app.main.show new ContactView

    home: ->
      app.main.show new HomeView

    pricing: ->
      app.main.show new PricingView

    schedule: ->
      app.main.show new ScheduleView
