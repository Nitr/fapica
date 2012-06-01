class RenameColumnType < ActiveRecord::Migration
  def up
    rename_column :devices, :type, :type_device
  end
end
