class Payment < ApplicationRecord

  belongs_to :participation
  has_many :training_session_participation
  has_one :competition, through: :participation
  has_one :team, through: :participation

  monetize :amount_cents


  def self.ransackable_attributes(auth_object = nil)
    return ["amount_cents", "amount_currency", "created_at", "id", "participation_id", "updated_at", "was_payed"]
  end

  def self.ransackable_associations(auth_object = nil)
    return ["competition", "participation", "team", "training_session_participation"]
  end
end
