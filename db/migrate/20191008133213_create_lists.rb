class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :title
      t.integer :user_id

      t.timestamps
    end
  end
end
