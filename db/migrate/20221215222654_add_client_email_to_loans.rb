class AddClientEmailToLoans < ActiveRecord::Migration[5.2]
  def change
    add_column :loans, :client_email, :string
  end
end
