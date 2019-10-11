class AddCompletedToLists < ActiveRecord::Migration[6.0]
  def change
    add_column :lists, :completed, :boolean, :default => false
  end
end
