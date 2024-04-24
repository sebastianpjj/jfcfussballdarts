class AddAmountCentsToPayment < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :amount_cents, :integer, null: false
    add_column :payments, :amount_currency, :string
  end
end
