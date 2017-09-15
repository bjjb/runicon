express = require 'express'
morgan = require 'morgan'
fs = require 'fs'
child_process = require 'child_process'

app = express()

make = (paths...) ->
  f = (target) ->
    new Promise (resolve, reject) ->
      child_process.exec "make #{target}", (err, stdout, stderr) ->
        console.log stdout
        console.error stderr
        return reject(err) if err?
        resolve()
  (req, res, next) ->
    { path } = req
    path = path[1..-1]
    path = 'index.html' if path is ''
    return next() unless path in paths
    f(path)
      .then next
      .catch next

app.use make('index.html', 'style.css', 'app.js')
app.use morgan('tiny')
app.use express.static('.')

app.listen process.env.PORT ? 8080, ->
  { name, version } = require './package'
  { address, port } = @address()
  console.log "#{name} v#{version} listening on #{address}:#{port}"
