class CreateTrainingSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :training_sessions do |t|
      t.string :name
      t.belongs_to :competition
      t.datetime :start_date
      t.datetime :end_date
      t.integer :participation_charge_cents
      t.string  :participation_charge_currency
      t.timestamps
    end
  end
end