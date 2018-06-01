class QuickMailer < ApplicationMailer
  default from: "Anthony Bayardelle <anthony@linchpinrealty.com>"

  def new_quick(quick)
    @quick = quick
    mail(to: "anthony@bayardellehomes.com", subject: "New Quick Contact on Linchpin Realty")
  end
end