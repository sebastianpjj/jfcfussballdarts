ActiveAdmin.register Participation do

  menu priority: 2

  actions :all, except: %i[destroy]
  permit_params :team_id, :competition_id

  filter :competition

end