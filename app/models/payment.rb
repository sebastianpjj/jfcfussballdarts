class Payment < ApplicationRecord
  belongs_to :participation

  monetize :amount_cents
end
