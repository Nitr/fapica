class Cards extends Spine.Controller
  
  events:
    'click .do':'showDo'
    'click .line-cards':'select'
    'click .time':'add'
  
  className: 'cards'
    
  constructor: ->
    super
    @active @render
    
  render: =>
    item = Cardes.all()
    console.log item
    @html $.tmpl('app/views/cards')
    $.tmpl('app/views/card-item', item).appendTo('.cardes')
    
  showDo: =>
    if $('.do-list').css('display') == 'none'
      $('.do-list').css({'display': 'block'})
    else
      $('.do-list').css({'display': 'none'})
      
  select: (e) =>
    e.preventDefault(); 
    if ($(e.target).parent().attr('class') == 'line-cards')
      $('div[name*="item"]').attr({'class':'line-cards'})
      $(e.target).parent().attr({'class': 'line-cards select'})
     
  add: =>
    @navigate '/cards/add'
    
window.Cards = Cards