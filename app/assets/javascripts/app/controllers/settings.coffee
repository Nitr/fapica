class Settings extends Spine.Controller

  constructor: ->
    super
    @render()
    
  render: ->
    @html $.tmpl('app/views/settings')


window.Settings = Settings 