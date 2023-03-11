class NewSubscriberMailer < ApplicationMailer
  default from: "Linchpin Realty <admin@linchpinrealty.com>"

  def new_subscriber(subscriber)
    @subscriber = subscriber
    mail(to: ["anthony@LinchpinRealty.com", "admin@LinchpinRealty.com"], subject: "New Subscriber on Linchpin Realty")
  end
end
