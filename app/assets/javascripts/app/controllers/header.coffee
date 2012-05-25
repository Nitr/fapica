class Header extends Spine.Controller

  events:
    'click .main-button': 'triggerLogout'
    'click .settings': 'triggerSettings'
    'click .back': 'triggerBack'
  
  constructor: ->
    super
    @render()
    @activate()
    
  render: ->
    @html $.tmpl('app/views/header')


  activate:()->
    if jQuery.cookie('name') != "" && jQuery.cookie('name') != null
      $('#greetings').text("Hello "+jQuery.cookie('name')+"!")
      $('.header div').css({display: 'block'})
      $('.header p.back').css({display: 'block'})

  deactivate:->
    $('#greetings').text('')
    $('.header div').css({display: 'none'})
    $('.header p.back').css({display: 'none'})
    
  triggerLogout: (e) ->
    $.get('/logout.json', (e) ->
    )
    jQuery.cookie("name", "")
    @navigate '/login'
    
  triggerSettings: (e) ->
    @navigate '/settings'
    console.log 0
    
  triggerBack: (e) ->
    @navigate '/pages'

window.Header = Header 