class CreateTeamAssignments < ActiveRecord::Migration[5.2]
  def change

    create_table "team_assignments", :force => true, :id => false do |t|
      t.integer "team_id", :null => false
      t.integer "client_id", :null => false
    end

  end
end
