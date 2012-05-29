class Kpp extends Spine.Controller
 
  events:
    'click .other':'selectKpp'
    'click .do':'showDo'
    'click .kpp-item':'tokpp'
    'click .up': 'up'
    'click .down': 'down'
    
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
    itemsL = Logs.all()
    #console.log itemsL
    #array = {'users': items, 'log': itemsL}
    @html $.tmpl('app/views/kpp', items)
    $.tmpl('app/views/kpp-journal', itemsL).appendTo('.journal .left');
    
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
    
  up: =>
    $('.journal .left').stop();
    height = parseInt($('.journal .left').height())
    console.log parseInt($('.journal .left').css('marginTop'))
    if (height-191 > -parseInt($('.journal .left').css('marginTop')))
      if(parseInt($('.journal .left').css('marginTop')) <= 0)
        $('.journal .left').animate('marginTop': parseInt($('.journal .left').css('marginTop'))-50+'px')
    
  down: =>
    $('.journal .left').stop();
    console.log parseInt($('.journal .left').css('marginTop'))
    if(parseInt($('.journal .left').css('marginTop')) < 0)
      $('.journal .left').animate('marginTop': parseInt($('.journal .left').css('marginTop'))+50+'px')
    if(parseInt($('.journal .left').css('marginTop')) > 0)
      $('.journal .left').animate('marginTop': 0+'px')
    
window.Kpp = Kpp