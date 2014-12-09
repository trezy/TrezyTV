module.exports = ( grunt, options ) ->
  mongo:
    command: './bin/mongo.sh'
    options:
      async: true
  api:
    command: './bin/api.sh'
    options:
      async: true
