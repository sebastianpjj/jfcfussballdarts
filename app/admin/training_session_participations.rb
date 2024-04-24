ActiveAdmin.register TrainingSessionParticipation do

  menu priority: 5

  actions :all, except: %i[destroy]
  permit_params :training_session_id,
                :participation_id

  filter :competition

end
