class EventHelpersMailer < ApplicationMailer

  def send_rsvp(recipient_name, recipient_email_address)
    @recipient_name = recipient_name

    mail(
      to: recipient_email_address,
      subject: 'Deine Unterstützung | JFC Eintracht Feldberg',
    )
  end
end
