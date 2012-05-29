class Settings extends Spine.Controller

  events:
    'click .other':'selectSettings'
    'click #devices':'toDevices'
  
  constructor: ->
    super
    @render()
    
  render: ->
    @html $.tmpl('app/views/settings')
    
  selectSettings: ->
    if $('.kpps').css('display') == 'none'
      $('.kpps').css({'display': 'block'})
    else
      $('.kpps').css({'display': 'none'})

  toDevices: ->
    @navigate '/settings/diveces'
    $('.kpps').css({'display': 'none'})

window.Settings = Settings 