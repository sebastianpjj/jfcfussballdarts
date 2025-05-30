class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :name
      t.belongs_to :team
      t.boolean :is_captain
      t.timestamps
    end
  end
end
