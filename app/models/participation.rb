class Participation < ApplicationRecord
  belongs_to  :team
  has_many :players, through: :team
  belongs_to :competition
  has_one  :payment
  has_many :training_session_participations

  validate :validate_team_name_uniqueness

  accepts_nested_attributes_for :team
  accepts_nested_attributes_for :training_session_participations
  has_secure_token :confirmation_token

  after_commit do
    p = self.payment || Payment.new
    p.participation = self
    p.amount_cents = self.competition.participation_charge_cents
    p.amount_cents += self.training_session_participations.sum {|r| r.training_session.participation_charge_cents}
    p.save
    self.send_confirmation_mail
  end

  def send_confirmation_mail
    TeamMailer.confirmation(self).deliver_now
  end

  def send_confirmed_mail
    TeamMailer.confirmation_complete(self).deliver_now
  end

  def confirm!
    unless self.confirmed?
      self.update_column(:confirmed_at, Time.now)
      self.send_confirmed_mail
    end
  end

  def to_s
    return "#{self.team.name} | #{self.competition.name}"
  end

  def validate_team_name_uniqueness
    teams = self.competition.teams
    teams = teams.where.not(id: self.id) if self.persisted?

    if teams.where(name: self.team.name).exists?
      self.errors.add("team.name", "Bitte wähle einen anderen Teamnamen. Dieser ist bereits vergeben.")
    end
  end

  def confirmed?
    return self.confirmed_at.present?
  end

  def self.ransackable_attributes(auth_object = nil)
    ["competition_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["competition", "team"]
  end
end