pushState = require( 'grunt-connect-pushstate/lib/utils' ).pushState

module.exports = ( grunt, options ) ->
  options:
    middleware: ( connect, options ) ->
      middlewares = []

      middlewares.push pushState()

      if not Array.isArray options.base
        options.base = [options.base]

      directory = options.directory or options.base[options.base.length - 1]
      for base in options.base
        middlewares.push connect.static base

      middlewares.push connect.directory directory

      middlewares

  development:
    options:
      port: 9001

  production:
    options:
      keepalive: true
      port: 80
