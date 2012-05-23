class CreateTerminals < ActiveRecord::Migration
  def change
    create_table :terminals do |t|
      t.string :hashkey
      t.string :name
      t.references :company

      t.timestamps
    end
    add_index :terminals, :company_id
  end
end
