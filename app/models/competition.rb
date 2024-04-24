class Competition < ApplicationRecord
  has_many :participations
  has_many :training_session_participations, through: :participations
  has_many :teams, through: :participations
  has_many :players, through: :teams
  has_many :payments, through: :participations
  has_many :training_sessions

  monetize :participation_charge_cents

  validates :slug, uniqueness: true
  validates :name, uniqueness: true
  validates :start_date, uniqueness: true
  validates :end_date, uniqueness: true
  validates :participation_charge_cents, uniqueness: true
  validates :participation_charge_currency, uniqueness: true

  before_validation do
    self.slug = self.slug.parameterize
  end

  def self.ransackable_attributes(auth_object = nil)
    return ["id", "name"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["payments", "players", "teams"]
  end
end
