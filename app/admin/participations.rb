ActiveAdmin.register Participation do

  menu priority: 2

  actions :all, except: %i[destroy]
  permit_params :team_id, :competition_id

  filter :competition


  index do
    id_column
    column :team do |r|
      r.team.name
    end
    column :competition do |r|
      r.competition.name
    end
    column :confirmed do |r|
      r.confirmed?
    end
    column :created_at
    column :updated_at
  end
end