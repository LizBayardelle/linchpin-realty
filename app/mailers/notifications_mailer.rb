class NotificationsMailer < ApplicationMailer
  default from: "Linchpin Realty <admin@linchpinrealty.com>"

  def document_received(document)
    @document = document
    mail(to: document.user.email, subject: "Your #{ document.name } Has Been Received by Linchpin Realty")
  end

  def document_uploaded(document)
    @document = document
    mail(to: "admin@linchpinrealty.com", subject: "New Document: #{ document.name } from #{ document.user.full_name }")
  end

end
