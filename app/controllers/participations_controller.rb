class ParticipationsController < ApplicationController
  skip_before_action :verify_authenticity_token


  def create
    @competition = Competition.find_by!(slug: params[:slug])
    @record = Participation.new(create_params)
    @payment = @record.build_payment(
      amount_cents:     @competition.participation_charge_cents,
      amount_currency:  @competition.participation_charge_currency
    )
    @record.save

    unless @record.save
      render json: @record.errors, status: :unprocessable_entity
      return
    end

    render :show
  end

  def show
    @record = Participation.find(params[:id])
    @competition = @record.competition
  end

  private

  def create_params
    params.require(:participation).permit(
      :competition_id,
      team_attributes: [
        :name, :email, :phone,
        players_attributes: [:name, :is_captain]
      ]

    )
  end

end
