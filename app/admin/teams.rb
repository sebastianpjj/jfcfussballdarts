ActiveAdmin.register Team do

  menu priority: 3

  actions :all, except: %i[destroy]
  permit_params :name,
                :email,
                :phone,
                :competition_id

  filter :name
  filter :email
  filter :phone
  filter :competition

end
