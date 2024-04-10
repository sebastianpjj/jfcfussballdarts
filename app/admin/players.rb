ActiveAdmin.register Player do

  menu priority: 4

  actions :all, except: %i[destroy]
  permit_params :name,
                :team_id,
                :age,
                :is_captain

  filter :name
  filter :team
  filter :competition

end
