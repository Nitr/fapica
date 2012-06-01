class Header extends Spine.Controller

  className: 'header'

  events:
    'click .main-button': 'triggerLogout'
    'click .settings-butt': 'triggerSettings'
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
    
  triggerBack: (e) ->
    @navigate '/main'

window.Header = Header 