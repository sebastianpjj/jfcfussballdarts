class CompetitionsController < ApplicationController

  def show
    @competition = find_competition_by_slug_or_current!()
    @training_sessions = @competition.training_sessions
  end

  private

  def find_competition_by_slug_or_current!
    return Competition.find_by!(is_current: true) if params[:slug] == 'current'

    Competition.find_by!(slug: params[:slug])
  end
end