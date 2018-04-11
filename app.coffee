icon = null

randomIcon = ->
  code = Math.floor(Math.random() * 4000)
  icon.innerText = String.fromCharCode(code)

loadIcon = (icon) ->
  localStorage?.runicon?.latest ? randomIcon()

addEventListener 'load', (e) ->
  main = document.querySelector('main')
  main.querySelector('article').hidden = true
  icon = main.querySelector('i#icon')
  loadIcon()
