ActiveAdmin.register Payment do

  menu priority: 6

  actions :all, except: %i[new edit destroy]
  permit_params :was_payed


  filter :was_payed
  filter :team
  filter :competition


  index do
    # selectable_column
    id_column
    column :team do |r|
      r.team.name
    end
    column :competition do |r|
      r.competition.name
    end

    column "Betrag" do |r|
      r.amount.format(symbol: '€ ')
    end
    column "bezahlt?", :was_payed
    column :created_at
  end

end
