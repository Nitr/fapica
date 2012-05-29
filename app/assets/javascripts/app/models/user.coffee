class User extends Spine.Model
  @configure "api/user", "email", "f", "i", "o", "job", "photo", "namer", "visit_last", "visit_penult"
  @extend Spine.Model.Ajax

window.User = User

