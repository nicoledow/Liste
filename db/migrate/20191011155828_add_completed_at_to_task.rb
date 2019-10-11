class AddCompletedAtToTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :completed_at, :datetime, :default => nil
  end
end
