class AddCurrentClientToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :current_client, :boolean, default:false
  end
end
