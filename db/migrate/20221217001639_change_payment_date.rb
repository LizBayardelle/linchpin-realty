class ChangePaymentDate < ActiveRecord::Migration[5.2]
  def change
    change_column :payments, :date, :datetime
  end
end
