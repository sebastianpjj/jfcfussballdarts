class AddSloganToTeam < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :slogan, :string
  end
end
