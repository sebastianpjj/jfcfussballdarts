class Competition < ApplicationRecord
  has_many :participations
  has_many :training_session_participations, through: :participations
  has_many :teams, through: :participations
  has_many :players, through: :teams
  has_many :payments, through: :participations
  has_many :training_sessions

  monetize :participation_charge_cents

  validates :slug, uniqueness: true
  validates :slug, exclusion: { in: %w[current], message: "ist reserviert" }
  validates :name, uniqueness: true
  validates :start_date, uniqueness: true
  validates :end_date, uniqueness: true
  validates :participation_charge_cents, presence: true
  validates :participation_charge_currency, presence: true

  before_validation do
    self.slug = self.slug.parameterize
    self.participation_charge_currency ||= "EUR"
  end

  before_save :ensure_single_current

  private

  def ensure_single_current
    if is_current? && is_current_changed?
      Competition.where(is_current: true).where.not(id: id).update_all(is_current: false)
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    return ["id", "name", "is_current"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["payments", "players", "teams"]
  end
end
