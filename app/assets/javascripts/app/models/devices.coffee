class Devices extends Spine.Model
  @configure "api/get_device"
  @extend Spine.Model.Ajax

window.Devices = Devices