class Kpp extends Spine.Controller
  events:
    'click .other':'selectKpp'
    'click .do':'showDo'
    'click .kpp-item':'tokpp'
    
  className: 'kpp'
    
  constructor: ->
    super
    #User.fetch()
    User.bind('refresh change', @render)
    Logs.bind('refresh change', @render)
    #User.fetch()
    #@render()
    
   # User.bind 'refresh', -> 
   #   Spine.Route.setup()

    
  render: =>
    items = User.all()
    itemsl = Logs.all()
    @html $.tmpl('app/views/kpp', items, itemsl)
    
  selectKpp: =>
    if $('.kpps').css('display') == 'none'
      $('.kpps').css({'display': 'block'})
    else
      $('.kpps').css({'display': 'none'})
      
  showDo: =>
    if $('.do-list').css('display') == 'none'
      $('.do-list').css({'display': 'block'})
    else
      $('.do-list').css({'display': 'none'})
   
  tokpp: (e) ->
    item = $(e.target).item()
    console.log item
    #@navigate '/kpp', item.id
    
 # render_log: =>
 #    JQuery('.sdfsdfs').html($.tmpl('app/views/kpp'))
window.Kpp = Kpp