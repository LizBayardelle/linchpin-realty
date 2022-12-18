class CreateLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :loans do |t|
      t.date :first_payment
      t.decimal :principal, :precision => 10, :scale => 2
      t.decimal :interest_rate, :precision => 10, :scale => 3
      t.integer :term_months
      t.boolean :active
      t.references :user
      t.text :admin_notes

      t.timestamps
    end
  end
end
