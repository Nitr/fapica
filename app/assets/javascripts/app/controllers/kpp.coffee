class Kpp extends Spine.Controller
  
  className: 'kpp'
    
  constructor: ->
    super
    @render()
    
  render: =>
    @html $.tmpl('app/views/kpp', user)
    
window.Kpp = Kpp