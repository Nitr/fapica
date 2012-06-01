$ = jQuery

class List extends Spine.Controller
  
  className: 'list'
  
  elements: 
    '.items': 'items'
  
  events:
    'click #kpp': 'kpp'
    'click #cards': 'cards'
    'click #journal': 'journal'
    
  constructor: ->
    super
    @html @render
    
  render: =>
    $.tmpl('app/views/main')
    
  kpp: (e) ->
    @navigate '/kpp', 1
    
  cards: (e) ->
    @navigate '/cards'
    
  journal: (e) ->
    @navigate '/journal'
    
class Devices extends Spine.Controller
  
  className: 'devices'
  
  events:
    'click .other':'selectSettings'
    'click #main':'toMain'
    'click .key':'get_key'

  constructor: ->
    super
    @active @render
  
  render: =>
    items = Device.all()
    @html $.tmpl('app/views/settings-devices')
    $.tmpl('app/views/settings-devices-item', items).appendTo('.devices-body');
    
  selectSettings: ->
    if $('.kpps').css('display') == 'none'
      $('.kpps').css({'display': 'block'})
    else
      $('.kpps').css({'display': 'none'})

  toMain: ->
    @navigate '/settings'
    $('.kpps').css({'display': 'none'})
    
  get_key: (e) ->
    id = $(e.target).parent().attr('id')
    if ($('td[name*='+id+']').css('display') == 'none')
      $('.show-key').css({'display':'none'})
      $('td.key').removeClass("sel")
      $(e.target).parent().addClass("sel")
      $('td[name*='+id+']').css({'display':'block'})
    else 
      $('td.key').removeClass("sel")
      $('td[name*='+id+']').css({'display':'none'})
    
class AddCards extends Spine.Controller
  
  events:
    'click .read-card':'read'

  constructor: ->
    super
    @active @render
  
  render: =>
    @html $.tmpl('app/views/cards-add')
    
  read: ->
    $('.good').html('');
    $.tmpl('app/views/cards-next').appendTo('.good');
    
class Main extends Spine.Controller
  
  constructor: ->    
    super
    @header = new Header
    @list = new List
    @kpp = new Kpp
    @login = new Login
    @settings = new Settings
    @cards = new Cards
    @devices = new Devices
    @addCards = new AddCards
    @journal = new Journal
    
    new Spine.Manager(@header, @list,@kpp, @login, @settings, @cards, @devices, @addCards, @journal)
    
    @append(@header, @list, @kpp, @login, @settings, @cards, @devices, @addCards, @journal)
    
    @routes
      '/main': (params) -> 
        @list.active(params)
        @header.activate(params)
        @direct()
      '/login': (params) -> 
        @login.active(params)
        @login.render()
        @direct()
      '/kpp/:id': (params) -> 
        @kpp.active(params)
        @header.activate(params)
        User.fetch()
        Logs.fetch()
        @direct()
      '/settings': (params) -> 
        @settings.active(params)
        @settings.render()
        @header.activate(params)
        @direct()
      '/cards': (params) -> 
        @cards.active(params)
        @header.activate(params)
        @direct()
      '/settings/devices': (params) -> 
        @devices.active(params)
        @header.activate(params)
        @direct()
      '/cards/add': (params) ->
        @addCards.active(params)
        @header.activate(params)
        @direct()
      '/journal': (params) ->
        @journal.active(params)
        @header.activate(params)
        Logs.fetch()
        @direct()

    @navigate '/main'
    
    Spine.Route.setup()
    Logs.fetch()
    Cardes.fetch()
    Device.fetch()
    
  direct: -> 
    if jQuery.cookie("name") == '' || jQuery.cookie("name") == null
      @navigate '/login'
  
window.Main = Main