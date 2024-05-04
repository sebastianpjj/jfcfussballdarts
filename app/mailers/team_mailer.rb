class TeamMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.team_mailer.confirmation.subject
  #
  def confirmation(participation)
    @participation = participation
    @team = participation.team
    @name = participation.team.name

    mail(
      to: @team.email,
      subject: 'Deine Anmeldung beim Fussballdart-Turnier | JFC Eintracht Feldberg',
    )
  end

  def confirmation_complete(participation)
    @participation = participation
    @team = participation.team
    @name = participation.team.name

    mail(
      to: @team.email,
      subject: 'Bestätigung deiner Anmeldung zum Fussballdart-Turnier | JFC Eintracht Feldberg',
    )
  end
end
