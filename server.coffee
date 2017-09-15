express = require 'express'
morgan = require 'morgan'

app = express()

app.use morgan('tiny')

app.use express.static('.')

app.listen process.env.PORT ? 8080, ->
  { name, version } = require './package'
  { address, port } = @address()
  console.log "#{name} v#{version} listening on #{address}:#{port}"
