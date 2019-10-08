class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :description
      t.integer :list_id
      t.boolean :completed, :default => false
      t.timestamps
    end
  end
end
