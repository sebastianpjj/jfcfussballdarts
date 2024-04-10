class Team < ApplicationRecord
  has_many :participations
  has_many :competitions, through: :participations
  has_many :payments, through: :participations
  has_many :players

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

end
