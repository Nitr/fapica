class Header extends Spine.Controller

  events:
    'click .main-button': 'triggerLogout'
    'click .settings': 'triggerSettings'
    'click .back': 'triggerBack'
  
  constructor: ->
    super
    @render()

  render: ->
    @html $.tmpl('app/views/header')


  activate:()->
    $('#greetings').text("Hello User!")
    $('.header div').css({display: 'block'})
    $('.header p.back').css({display: 'block'})

  deactivate:->
    $('#greetings').text('')
    $('.header div').css({display: 'none'})
    $('.header p.back').css({display: 'none'})
    
  triggerLogout: (e) ->
    @navigate '/logout'
    
  triggerSettings: (e) ->
    @navigate '/settings'
    console.log 0
    
  triggerBack: (e) ->
    @navigate '/'

window.Header = Header 