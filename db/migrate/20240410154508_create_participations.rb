class CreateParticipations < ActiveRecord::Migration[7.0]
  def change
    create_table :participations do |t|
      t.belongs_to :team
      t.belongs_to :competition
      t.belongs_to :payment
      t.timestamps
    end
  end
end
