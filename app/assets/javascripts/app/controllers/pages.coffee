$ = jQuery

class PagesEdit extends Spine.Controller
  events:
    'click .back': 'back'
    'submit form': 'update'

  constructor: ->
    super
    @active (params) ->
      @change Page.find(params.id)

  render: =>
    @html $.tmpl('app/views/pages/edit', @item)

  change: (item) ->
    @item = item
    @render()

  update: (e) ->
    e.preventDefault()
    @item.updateAttributes($(e.target).serializeForm())
    @back()
   
  back: ->
    @navigate '/pages', @item.id
  
class PagesItem extends Spine.Controller
  events:
    'click .back': 'back'
    'click .edit': 'edit'
    'click .destroy': 'destroyItem'
    
  constructor: ->
    super
  
    Page.bind 'change', (item) => 
      @render() if item.eql(@item)

    @active (params) ->
      @change Page.find(params.id)
    
  render: =>
    @html $.tmpl('app/views/pages/show', @item)
    
  change: (item) ->
    @item = item
    @render()

  destroyItem: ->
    @item.destroy()
    @back()

  edit: ->
    @navigate '/pages', @item.id, 'edit'
    
  back: ->
    @navigate '/pages'

class PagesList extends Spine.Controller
  className: 'list'
  
  elements: 
    '.items': 'items'
  
  events:
    'click .item': 'show'
    'click .create': 'create'
    'click #kpp': 'kpp'
    'click #cards': 'cards'
    'click #journal': 'settings'
    
  constructor: ->
    super
    @html $.tmpl('app/views/pages/list')
    Page.bind('refresh change', @render)
    
  render: =>
    @log 1
    items = Page.all()
    @items.html $.tmpl('app/views/pages/item', items)
    
  show: (e) ->
    item = $(e.target).item()
    console.log item
    @navigate '/pages', item.id
    
  create: (e) ->
    item = Page.create(name: 'Пустая запись')
    @navigate '/pages'
    
  kpp: (e) ->
    @navigate '/kpp', 1
    
  cards: (e) ->
    @navigate '/cards'
    
  journal: (e) ->
    @navigate '/journal'
    
class Devices extends Spine.Controller
  
  events:
    'click .other':'selectSettings'
    'click #main':'toMain'

  constructor: ->
    super
    @active @render
  
  render: =>
    @html $.tmpl('app/views/settings-devices')
    
  selectSettings: ->
    if $('.kpps').css('display') == 'none'
      $('.kpps').css({'display': 'block'})
    else
      $('.kpps').css({'display': 'none'})

  toMain: ->
    @navigate '/settings'
    $('.kpps').css({'display': 'none'})
    
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
    
class Pages extends Spine.Controller
  
  constructor: ->    
    super
    @header = new Header
    @list = new PagesList
    @edit = new PagesEdit
    @item = new PagesItem
    @kpp = new Kpp
    @login = new Login
    @settings = new Settings
    @cards = new Cards
    @devices = new Devices
    @addCards = new AddCards
    
    new Spine.Manager(@header, @list, @edit, @item, @kpp, @login, @settings, @cards, @devices, @addCards)
    
    @append(@header, @list, @edit, @item, @kpp, @login, @settings, @cards, @devices, @addCards)
    
    @routes
      '/pages/:id/edit': (params) ->
        @edit.active(params)
        @direct()
      '/pages/:id': (params) ->
        @item.active(params)
        @direct()
      '/pages': (params) -> 
        @list.active(params)
        @header.activate(params)
        @direct()
      '/login': (params) -> 
        @login.active(params)
        @direct()
      '/kpp/:id': (params) -> 
        @kpp.active(params)
        @header.activate(params)
        @direct()
      '/settings': (params) -> 
        @settings.active(params)
        @header.activate(params)
        @direct()
      '/cards': (params) -> 
        @cards.active(params)
        @header.activate(params)
        @direct()
      '/settings/diveces': (params) -> 
        @devices.active(params)
        @header.activate(params)
        @direct()
      '/cards/add': (params) ->
        @addCards.active(params)
        @header.activate(params)
        @direct()

    @navigate '/pages'
    
    # Only setup routes once pages have loaded
    Page.bind 'refresh', -> 
      Spine.Route.setup()

    Page.fetch()
    User.fetch()
    Logs.fetch()
    Cardes.fetch()
  direct: -> 
    if jQuery.cookie("name") == '' || jQuery.cookie("name") == null
      @navigate '/login'
  
window.Pages = Pages