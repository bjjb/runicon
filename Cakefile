fs = require 'fs'
pug = require 'pug'
stylus = require 'stylus'
coffee = require 'coffee-script'

task 'index.html', 'build the index page', ->
  pug2html('index.pug', 'index.html')

task 'style.css', 'build the stylesheet', ->
  styl2css('style.styl', 'style.css')

task 'app.js', 'build the application script', ->
  coffee2js('app.coffee', 'app.js')

task 'index.js', 'build the package index script', ->
  coffee2js('index.coffee', 'index.js')

readFile = (f) ->
  new Promise (resolve, reject) ->
    fs.readFile f, 'utf8', (err, data) ->
      return reject(err) if err?
      resolve(data)

writeFile = (f) ->
  (data) ->
    new Promise (resolve, reject) ->
      fs.writeFile f, data, 'utf8', (err) ->
        return reject(err) if err?
        resolve(err)

coffee2js = (src..., target) ->
  Promise.all(readFile(s) for s in src)
    .then (sources) -> sources.join("\n")
    .then compileCoffee(target)
    .then writeFile(target)
    .catch console.error

styl2css = (src..., target) ->
  Promise.all(readFile(s) for s in src)
    .then (sources) -> sources.join("\n")
    .then compileStylus(target)
    .then writeFile(target)
    .catch console.error

pug2html = (src, target) ->
  writeFile(target)(pug.renderFile(src))
    .catch console.error
  
compileCoffee = (filename) ->
  (src) ->
    coffee.compile(src, { filename })

compileStylus = (filename) ->
  (src) ->
    new Promise (resolve, reject) ->
      stylus.render src, { filename }, (err, css) ->
        return reject(err) if err?
        return resolve(css)
