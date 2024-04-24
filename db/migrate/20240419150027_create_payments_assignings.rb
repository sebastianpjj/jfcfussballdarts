class CreatePaymentsAssignings < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.belongs_to :participation
      t.boolean :was_payed
      t.timestamps
    end
  end
end
