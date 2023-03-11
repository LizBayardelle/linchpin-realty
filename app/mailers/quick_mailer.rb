class QuickMailer < ApplicationMailer
  default from: "Linchpin Realty <admin@linchpinrealty.com>"

  def new_quick(quick)
    @quick = quick
    mail(to: "anthony@LinchpinRealty.com", subject: "New Quick Contact on Linchpin Realty")
  end
end
