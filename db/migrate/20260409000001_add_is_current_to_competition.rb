class AddIsCurrentToCompetition < ActiveRecord::Migration[7.0]
  def change
    add_column :competitions, :is_current, :boolean, default: false, null: false
  end
end
