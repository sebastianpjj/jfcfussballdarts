ActiveAdmin.register Competition do

  menu priority: 2

  actions :all, except: %i[destroy]
  permit_params :name, :slug, :participation_charge_cents, :participation_charge_currency

  filter :name

end
