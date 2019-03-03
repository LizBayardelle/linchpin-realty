class SendConsultationSchedulingMailer < ApplicationMailer
  default from: "Anthony Bayardelle <anthony@linchpinrealty.com>"

  def send_consultation_scheduling(subscriber)
    @subscriber = subscriber
    mail(to: subscriber.email, subject: "Schedule Your Free 15 Minute Consultation with Linchpin Realty")
  end
end
