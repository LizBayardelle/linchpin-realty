class NotificationsMailer < ApplicationMailer
  default from: "Linchpin Realty <admin@linchpinrealty.com>"

  def document_approved(document)
    @document = document
    mail(to: document.user.email, subject: "Your #{ document.name } Has Been Received by Linchpin Realty")
  end

end
