class CreateAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments do |t|
      t.sting :due_date
      t.integer :task_id
      t.integer :user_id

      t.timestamps
    end
  end
end
