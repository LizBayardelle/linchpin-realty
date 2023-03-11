class ContactMailer < ApplicationMailer
  default from: "Linchpin Realty <admin@linchpinrealty.com>"

  def new_contact(contact)
    @contact = contact
    mail(to: "anthony@LinchpinRealty.com", subject: "New Contact Us Submission on Linchpin Realty")
  end
end
