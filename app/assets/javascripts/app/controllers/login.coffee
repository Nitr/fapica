class Login extends Spine.Controller
  
  events:
    'click .submit': 'submit'
    'click .remarka': 'remarka'
    
  className: 'login'
    
  constructor: ->
    super
    @render()
    
  render: =>
    @html $.tmpl('app/views/login', user)
    
  submit: (e) ->
    console.log 'submit'
    
  remarka: (e) ->
    console.log 'remarka'
    
window.Login = Login