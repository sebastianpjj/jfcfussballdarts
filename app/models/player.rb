class Player < ApplicationRecord
  belongs_to :team
  has_many :participations, through: :team
  has_many :competitions, through: :participations

  def self.ransackable_attributes(auth_object = nil)
    return [
      "name", "team_id",
    ]
  end

  def self.ransackable_associations(auth_object = nil)
    ["team", "participations", "competitions"]
  end
end
