class Participation < ApplicationRecord
  belongs_to  :team
  has_many :players, through: :team
  belongs_to  :competition
  has_one  :payment
  has_many :training_session_participations

  accepts_nested_attributes_for :team
  accepts_nested_attributes_for :training_session_participations

  after_commit do
    p = self.payment || Payment.new
    p.participation = self
    p.amount_cents = self.competition.participation_charge_cents
    p.amount_cents += self.training_session_participations.sum {|r| r.training_session.participation_charge_cents}
    p.save
  end

  def self.ransackable_attributes(auth_object = nil)
    ["competition_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["competition", "team"]
  end

  def to_s
    return "#{self.team.name} | #{self.competition.name}"
  end
end