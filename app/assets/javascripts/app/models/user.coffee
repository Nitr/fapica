class User extends Spine.Model
  @configure "id", "name", "pass"
  @extend Spine.Model.Ajax
  
  @url: "/user/sing_in"

window.User = User