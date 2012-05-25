class Cards extends Spine.Controller
  
  className: 'cards'
    
  constructor: ->
    super
    @active @render
    
  render: =>
    @html $.tmpl('app/views/cards')
    
window.Cards = Cards