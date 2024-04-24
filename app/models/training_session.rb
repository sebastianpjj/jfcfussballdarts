class TrainingSession < ApplicationRecord

  belongs_to :competition

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :name, presence: true

  monetize :participation_charge_cents


  def duration_in_minutes
    s = DateTime.parse(start_date.to_s)
    e = DateTime.parse(end_date.to_s)

    return (e - s).minutes.in_days.ceil
  end

  def self.ransackable_associations(auth_object = nil)
    ["competition"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["competition_id", "created_at", "end_date", "id", "name", "price_cents", "price_currency", "start_date", "updated_at"]
  end
end
