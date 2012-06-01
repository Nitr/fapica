class User extends Spine.Model
  @configure "api/user", "id", "email", "f", "i", "o", "job", "photo", "name", "visit_last", "visit_penult"
  @extend Spine.Model.Ajax

window.User = User

