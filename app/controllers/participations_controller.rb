class ParticipationsController < ApplicationController
  skip_before_action :verify_authenticity_token


  def create
    @competition = Competition.find_by!(slug: params[:slug])
    @record = @competition.participations.new(create_params)

    unless @record.save
      render json: @record.errors, status: :unprocessable_entity
      return
    end

    @record.players.first.update_column(:is_captain, true)
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
      training_session_participations_attributes: [:training_session_id],
      team_attributes: [
        :name, :slogan, :email, :phone,
        players_attributes: [:name, :is_captain]
      ]
    )
  end
end
