class Competition < ApplicationRecord
  has_many :participations
  has_many :teams, through: :participations
  has_many :players, through: :teams
  has_many :payments, through: :participations

  monetize :participation_charge_cents

  validates :slug, uniqueness: true

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
