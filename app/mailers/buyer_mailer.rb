class BuyerMailer < ApplicationMailer
  default from: "Anthony Bayardelle <anthony@linchpinrealty.com>"

  def new_buyer(buyer)
    @buyer = buyer
    mail(to: "anthony@LinchpinRealty.com", subject: "New Buyer Survey on Linchpin Realty")
  end
end
