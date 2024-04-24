class CreateTrainingSessionParticipations < ActiveRecord::Migration[7.0]
  def change
    create_table :training_session_participations do |t|
      t.belongs_to :training_session
      t.belongs_to :participation
      t.timestamps
    end
  end
end
