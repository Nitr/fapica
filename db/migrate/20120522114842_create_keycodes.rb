class CreateKeycodes < ActiveRecord::Migration
  def change
    create_table :keycodes do |t|
      t.string :keycode
      t.boolean :temp

      t.timestamps
    end
  end
end
