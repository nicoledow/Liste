class DeleteTeams < ActiveRecord::Migration[6.0]
  def change
    drop_table :teams
  end
end
