class Team < ApplicationRecord
  has_many :participations
  has_many :competitions, through: :participations
  has_many :payments, through: :participations
  has_many :players

  # validates :name, uniqueness: true
  validate :validate_team_name_presence


  accepts_nested_attributes_for :players

  def self.ransackable_attributes(auth_object = nil)
    return [
      "id",
      "name",
      "email",
      "phone",
    ]
  end

  def self.ransackable_associations(auth_object = nil)
    ["payments", "players", "competition"]
  end

  def validate_team_name_presence
    unless self.name.present?
      self.errors.add(:name, "Du musst einen Teamnamen angeben.")
    end
  end

end
