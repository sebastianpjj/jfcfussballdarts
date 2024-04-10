class Participation < ApplicationRecord
  belongs_to  :team
  belongs_to  :competition
  belongs_to  :payment
  has_many    :players, through: :team

  accepts_nested_attributes_for :team

  def self.ransackable_attributes(auth_object = nil)
    ["competition_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["competition", "team"]
  end
end