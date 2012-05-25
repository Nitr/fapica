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
    
    new Spine.Manager(@header, @list, @edit, @item, @kpp, @login, @settings, @cards)
    
    @append(@header, @list, @edit, @item, @kpp, @login, @settings, @cards)
    
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
        @direct()
      '/cards': (params) -> 
        @cards.active(params)
        @header.activate(params)
        @direct()

    @navigate '/pages'
    
    # Only setup routes once pages have loaded
    Page.bind 'refresh', -> 
      Spine.Route.setup()

    Page.fetch()
    User.fetch()
  direct: -> 
    if jQuery.cookie("name") == '' || jQuery.cookie("name") == null
      @navigate '/login'
  
window.Pages = Pages