class AddConfirmationAfftrToTeam < ActiveRecord::Migration[7.0]
  def change
    add_column :participations, :confirmation_token, :string, uniq: true, index: true
    add_column :participations, :confirmed_at, :datetime

    Participation.all.each do |t|
      t.confirmation_token = SecureRandom.hex(15)
      t.save
    end
  end


end
