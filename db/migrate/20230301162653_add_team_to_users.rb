class AddTeamToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :team, :boolean, default: false
  end
end
