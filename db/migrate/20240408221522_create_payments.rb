class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.integer :amount_cents
      t.string :amount_currency
      t.string :status
      t.timestamps
    end
  end
end
