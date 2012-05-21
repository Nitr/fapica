$ = jQuery

class Start extends Spine.Controller
  
  events:
    'click p.pages': 'triggerPages'
  
  constructor: ->    
    super
    @pages = new Pages
    
    @render()
    
    #@append(@pages)
    
    @routes
      '/': (params) -> 
        console.log 1
      '/pages': (params) -> 
        console.log 2
        #@pages.list.active(params)
    
        
  render: ->
    @html $.tmpl('app/views/start/list')
  
  triggerPages: ->
    @navigate '/pages'

window.Start = Start