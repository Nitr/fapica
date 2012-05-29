class Logs extends Spine.Model
  @configure "api/log", "visit"
  @extend Spine.Model.Ajax

window.Logs = Logs