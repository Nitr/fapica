class Cardes extends Spine.Model
  @configure "api/card", "email"
  @extend Spine.Model.Ajax

window.Cardes = Cardes