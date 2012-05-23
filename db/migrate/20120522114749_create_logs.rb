class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.references :user
      t.datetime :visit
      t.integer :visit_type

      t.timestamps
    end
    add_index :logs, :user_id
  end
end
