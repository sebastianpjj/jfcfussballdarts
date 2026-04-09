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
      subject: 'JFC Eintracht Feldberg | Deine Anmeldung beim Fussballdart-Turnier',
    )
  end

  def confirmation_complete(participation)
    @participation = participation
    @team = participation.team
    @name = participation.team.name

    mail(
      to: @team.email,
      subject: 'JFC Eintracht Feldberg | Bestätigung deiner Anmeldung zum Fussballdart-Turnier',
    )
  end

  def confirmation_complete_organizer(participation)
    @participation = participation
    @team = participation.team
    @name = participation.team.name

    mail(
      to: 'event@eintracht-feldberg.de',
      subject: 'JFC Eintracht Feldberg | Neue bestätigte Anmeldung zum Fussballdart-Turnier',
    )
  end
end
