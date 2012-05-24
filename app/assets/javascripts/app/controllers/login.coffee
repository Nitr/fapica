class Login extends Spine.Controller
  
  events:
    'click .submit': 'submit'
    'click .remarka': 'remarka'
    
  className: 'login'
    
  constructor: ->
    super
    @render()

  render: =>
    @html $.tmpl('app/views/login')
    
  submit: (e) ->
    #userData = new FormData()
   # userData.append("utf8", "✓")
   # userData.append("authenticity_token", $('meta[name=csrf-token]').attr('content'))
   # userData.append("user[email]", $('#email').val())
   # userData.append("user[password]", $('#password').val())
   # userData.append("user[remember_me]", 0)
   # userData.append("commit","Sign in")
    self = Spine.Route
    userData = {"utf8": "✓", "authenticity_token": $('meta[name=csrf-token]').attr('content'), "user[email]": $('#email').val(), "user[password]": $('#password').val(), "user[remember_me]": 0, "commit":"Sign in"} 
    $.post('/users/sign_in.json', userData, (e) ->
      #alert e.email
      
      if e.email 
        jQuery.cookie("name", e.email)
        if jQuery.cookie("name") != ""
          self.navigate '/pages'
    )
    
  remarka: (e) ->
    console.log 'remarka'
    
window.Login = Login