class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :due_or_paid
      t.date :date
      t.references :loan, foreign_key: true
      t.string :paid_by
      t.decimal :amount, precision: 10, scale: 2

      t.timestamps
    end
  end
end
