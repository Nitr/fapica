class Logs extends Spine.Model
  @configure "api/logs", "visit"
  @extend Spine.Model.Ajax

window.Logs = Logs