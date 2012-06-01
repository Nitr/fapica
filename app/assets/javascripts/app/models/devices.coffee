class Device extends Spine.Model
  @configure "api/device" , "name"
  @extend Spine.Model.Ajax

window.Device = Device