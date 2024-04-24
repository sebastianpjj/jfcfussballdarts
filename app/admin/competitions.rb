ActiveAdmin.register Competition do

  menu priority: 2

  actions :all, except: %i[destroy]
  permit_params :name, :slug, :participation_charge_cents, :start_date, :end_date

  filter :name

  form html: { multipart: true } do |f|
    f.semantic_errors(*f.object.errors)
    f.inputs do
        f.input :name, label: "Name"
        f.input :start_date, label: "Beginn"
        f.input :end_date, label: "Ende"
        f.input :participation_charge_cents, label: "Teilnahmegebühr in Cents"
        f.input :slug
    end
    f.actions
  end

  index do
    id_column
    column "Name", :name
    column "Beginn", :start_date
    column "Ende", :end_date
    actions
  end

  show do
    attributes_table do
      row "Name" do |r|
        r.name
      end
      row "Beginn" do |r|
        r.start_date
      end
      row "Ende" do |r|
        r.end_date
      end
      row "Teilnahmegebühr" do |r|
        r.participation_charge.format(symbol: '€ ')
      end
      row :slug
      row :updated_at
      row :created_at
    end
  end
end
