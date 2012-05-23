class User extends Spine.Model
  @configure "id", "name", "pass"
  @extend Spine.Model.Ajax

window.User = User