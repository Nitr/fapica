class RenameDeviceTypeInDevices < ActiveRecord::Migration
  def up
	rename_column :devices, :type_device, :device_type_id
  end
end
