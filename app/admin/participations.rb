ActiveAdmin.register Participation do

  menu priority: 2

  actions :all, except: %i[destroy]
  permit_params :team_id, :competition_id

  filter :competition

  csv do
    column(:id)
    column("Competition") { |participation| participation.competition&.name }
    column("Team") { |participation| participation.team&.name }
    column("Captain") { |participation| participation.team&.players&.find_by(is_captain: true)&.name }
    column("Captain Email") { |participation| participation.team&.email }
    column("Captain Telephone") { |participation| participation.team&.phone }
    column("Confirmed") { |participation| participation.confirmed? }
    column(:created_at)
    column(:updated_at)
  end


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