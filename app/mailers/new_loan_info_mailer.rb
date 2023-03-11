class NewLoanInfoMailer < ApplicationMailer
  default from: "Linchpin Realty <admin@linchpinrealty.com>"

  def new_loan_info(info)
    @info = info
    mail(to: "anthony@LinchpinRealty.com", subject: "New Loan Info Submission on Linchpin Realty")
  end
end
