class Loan < ApplicationRecord
  belongs_to :user, optional: true
  has_many :payments
  has_many :documents

  def balance
    balance = self.principal
    self.payments.all.each do |payment|
      if payment.due_or_paid == "Paid"
        balance -= payment.amount
      else
        balance += payment.amount
      end
    end
    balance
  end

  def last_payment
    n = self.term_months.to_i
    self.first_payment + n.to_i.months
  end

  def loan_identifier
    self.first_payment.year.to_s + " " + self.program + " Loan"
  end
  
  def name_identifier
    self.client_last_name + " " + self.first_payment.year.to_s + " " + self.program
  end
end
