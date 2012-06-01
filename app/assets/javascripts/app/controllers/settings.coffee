class Settings extends Spine.Controller

  className: 'settings'
  
  events:
    'click .other':'selectSettings'
    'click #devices':'toDevices'
    'keyup .company-input':'show'
    'click .to-do .back':'close'
    'click .to-do .save':'save'
  
  constructor: ->
    super
    Company.fetch()
    
  render: ->
    item = Company.all()
    @html $.tmpl('app/views/settings', item)
    
  selectSettings: ->
    if $('.kpps').css('display') == 'none'
      $('.kpps').css({'display': 'block'})
    else
      $('.kpps').css({'display': 'none'})

  toDevices: ->
    @navigate '/settings/devices'
    $('.kpps').css({'display': 'none'})
    
  show: (e) ->
    $('.to-do').animate({'marginTop': 0+'px'})
    
  close: ->
    $('.to-do').animate({'marginTop': -35+'px'})
    
  save: ->
    name2 = $('.company-input').val()
    id = $('.company-input-id').val()
    comp = Company.find(id)
    comp.name = name2
    comp.save()
    
window.Settings = Settings 