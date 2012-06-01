class Journal extends Spine.Controller
 
  className: 'journals'
    
  constructor: ->
    super
    @active @render
    
  render: =>
    items = Logs.all()
    @log items
    @html $.tmpl('app/views/journal')
    $.tmpl('app/views/journal-item', items).appendTo('.journal-items .left');
    
window.Journal = Journal