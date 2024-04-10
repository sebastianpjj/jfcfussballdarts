class AddSlugToCompetition < ActiveRecord::Migration[7.0]
  def change
    add_column :competitions, :slug, :string, null: false, unique: true, index: true
  end
end
