class CreateCompetitions < ActiveRecord::Migration[7.0]
  def change
    create_table :competitions do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.integer :participation_charge_cents
      t.string :participation_charge_currency
      t.timestamps
    end
  end
end
