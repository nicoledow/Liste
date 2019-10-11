class AddCompletedAtToList < ActiveRecord::Migration[6.0]
  def change
    add_column :lists, :completed_at, :datetime, :default => nil
  end
end
