class User extends Spine.Model
  @configure "api/user", "email"
  @extend Spine.Model.Ajax

window.User = User