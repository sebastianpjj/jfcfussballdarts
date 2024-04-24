ActiveAdmin.register TrainingSession do

  menu priority: 4

  actions :all, except: %i[destroy]
  permit_params :name,
                :competition_id,
                :start_date,
                :end_date,
                :participation_charge_cents

  filter :competition


  index do
    column "name", :name
    column "competition", :competition
    column "start_date", :start_date
    column "end_date", :end_date
    actions
  end

  form html: { multipart: true } do |f|
    f.semantic_errors(*f.object.errors)
    f.inputs do
      f.input :name, label: "name"
      f.input :competition, label: "competition"
      f.input :start_date, label: "Beginn"
      f.input :end_date, label: "Ende"
      f.input :participation_charge_cents, label: "Teilnahmegebühr in Cents"
    end

    f.actions
  end

  show do
    attributes_table do
      row :name
      row :competition
      row :start_date
      row :end_date
      row :price do |r|
        r.participation_charge.format(symbol: '€ ')
      end
    end
  end

end
