require.config
  paths:
    # RequireJS Plugins
    hbs: '../bower_components/require-handlebars-plugin/hbs'

    # Libraries
    'backbone': '../bower_components/backbone/backbone'
    'backbone.babysitter': '../bower_components/backbone.babysitter/lib/backbone.babysitter'
    'backbone.base-router': '../bower_components/backbone.base-router/dist/backbone.base-router'
    'backbone.intercept': '../bower_components/backbone.intercept/dist/backbone.intercept'
    'backbone.marionette': '../bower_components/marionette/lib/core/backbone.marionette'
    'backbone.radio': '../bower_components/backbone.wreqr/lib/backbone.radio'
    'backbone.wreqr': '../bower_components/backbone.wreqr/lib/backbone.wreqr'
    'handlebars': '../bower_components/handlebars/handlebars'
    'jquery': '../bower_components/jquery/dist/jquery'
    'moment': '../bower_components/moment/moment'
    'moment-range': '../bower_components/moment-range/lib/moment-range'
    'underscore': '../bower_components/underscore/underscore'

    # Templates
    tpl: '../templates'

    # Folder Shortcuts
    ctrl: 'controllers'
    r: 'routers'
    c: 'collections'
    m: 'models'
    v: 'views'
    s: 'shims'

  map:
    '*':
      'marionette': 'backbone.marionette'

  shim:
    underscore:
      exports: '_'

    backbone:
      deps: [
        'jquery'
        'underscore'
      ]
      exports: 'Backbone'

    handlebars:
      exports: 'Handlebars'

  hbs:
    disableI18n: true
    partialsUrl: '../templates'





require [
  's/marionette.radio'
  's/marionette.replaceElement'
  'App'
  'v/Root'
], (
  radioShim
  replaceElementShim
  App
  RootView
) ->
  app = new App

  app.rootView = new RootView

  window.app = app

  app.start()
