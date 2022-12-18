class AddProgramToLoans < ActiveRecord::Migration[5.2]
  def change
    add_column :loans, :program, :string
    add_column :loans, :client_last_name, :string
  end
end
