class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.references :list
      t.string :description
      t.boolean :is_complete, default: false
      t.integer :position
      t.timestamps null: false
    end
  end
end
