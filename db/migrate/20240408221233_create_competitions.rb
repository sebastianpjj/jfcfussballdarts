class CreateCompetitions < ActiveRecord::Migration[7.0]
  def change
    create_table :competitions do |t|
      t.string :name
      t.integer :participation_charge_cents
      t.string :participation_charge_currency
      t.timestamps
    end
  end
end
