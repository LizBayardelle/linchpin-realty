class AddArchivedToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :archived, :boolean, default: false
  end
end
