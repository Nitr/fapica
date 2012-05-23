class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.references :terminal
      t.integer :type
      t.string :name

      t.timestamps
    end
    add_index :devices, :terminal_id
  end
end
