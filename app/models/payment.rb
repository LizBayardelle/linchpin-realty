class Payment < ApplicationRecord
  belongs_to :loan

  def loan_balance_as_of
    loan = self.loan
    balance = loan.principal
    loan.payments.all.each do |payment|
      if payment.date <= self.date
        if payment.due_or_paid == "Paid"
          balance -= payment.amount
        else
          balance += payment.amount
        end
      end
    end
    balance
  end

end
