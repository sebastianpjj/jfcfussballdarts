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

  show do
    attributes_table do
      row :name
      row :slogan
      row :email
      row :phone
      row :created_at
      row :updated_at
    end

    if team.players.present?
      panel "Spieler" do
        attributes_table_for :players do
          team.players.each do |player|
            row "Name" do
              link_to "#{player.name}", admin_player_path(player)
            end
          end
        end
      end
    end

    # panel I18n.t('activerecord.models.address.one') do
    #   if dealer_branch_office.address.present?
    #     attributes_table_for :address do
    #       row I18n.t('activerecord.attributes.street') do
    #         dealer_branch_office.address.street
    #       end
    #       row I18n.t('activerecord.attributes.house') do
    #         dealer_branch_office.address.house
    #       end
    #       row I18n.t('activerecord.attributes.postal_code') do
    #         dealer_branch_office.address.postal_code
    #       end
    #       row I18n.t('activerecord.attributes.city') do
    #         dealer_branch_office.address.city
    #       end
    #     end
    #   end
    # end


  end

end
