class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.references :user
      t.string :name
      t.integer :position
      t.timestamps null: false
    end
  end
end
