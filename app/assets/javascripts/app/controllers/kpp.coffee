class Kpp extends Spine.Controller
  
  className: 'kpp'
    
  constructor: ->
    super
    User.fetch()
    @render()
    
   # User.bind 'refresh', -> 
   #   Spine.Route.setup()

    
  render: =>
    items = User.all()
    @log items
    @html $.tmpl('app/views/kpp')
    
window.Kpp = Kpp