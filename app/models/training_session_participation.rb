class TrainingSessionParticipation < ApplicationRecord

  belongs_to :participation
  belongs_to :training_session
  has_one :competition, through: :participation
  has_one :team, through: :participation

  def self.ransackable_associations(auth_object = nil)
    ["competition", "participation", "team", "training_session"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "participation_id", "training_session_id", "updated_at"]
  end
end
